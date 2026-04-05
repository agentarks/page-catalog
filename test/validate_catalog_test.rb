require "fileutils"
require "minitest/autorun"
require "open3"
require "pathname"
require "tmpdir"
require "yaml"
require "date"

class ValidateCatalogTest < Minitest::Test
  SCRIPT_PATH = File.expand_path("../scripts/validate_catalog.rb", __dir__)
  REQUIRED_FIELDS = %w[
    id
    name
    version
    status
    owner
    approved_by
    approved_on
    intended_use
    non_goals
    ux_rationale
    allowed_variations
    required_sections
    screenshots
    figma_link
    changelog
  ].freeze

  def test_validator_accepts_a_complete_catalog_entry
    Dir.mktmpdir("page-catalog-valid") do |dir|
      create_entry(dir, "landing-page")

      stdout, stderr, status = Open3.capture3("ruby", SCRIPT_PATH, dir)

      assert status.success?, failure_message(stdout, stderr)
      assert_includes stdout, "Catalog validation passed"
    end
  end

  def test_validator_rejects_missing_required_fields
    Dir.mktmpdir("page-catalog-invalid") do |dir|
      create_entry(dir, "landing-page", missing_fields: ["required_sections"])

      stdout, stderr, status = Open3.capture3("ruby", SCRIPT_PATH, dir)

      refute status.success?, "validator unexpectedly passed\n#{stdout}\n#{stderr}"
      assert_includes stdout + stderr, "required_sections"
    end
  end

  def test_validator_accepts_yaml_dates_from_real_entries
    Dir.mktmpdir("page-catalog-date") do |dir|
      create_entry(dir, "landing-page", changelog_date: Date.new(2026, 4, 5))

      stdout, stderr, status = Open3.capture3("ruby", SCRIPT_PATH, dir)

      assert status.success?, failure_message(stdout, stderr)
    end
  end

  def test_validator_accepts_declared_screenshot_assets_for_published_entries
    Dir.mktmpdir("page-catalog-published") do |dir|
      create_entry(
        dir,
        "landing-page",
        status: "published",
        approved_by: "board",
        approved_on: Date.new(2026, 4, 5),
        screenshot_paths: {
          "desktop" => "screenshots/landing-page-desktop-v1.png",
          "mobile" => "screenshots/landing-page-mobile-v1.png"
        }
      )

      stdout, stderr, status = Open3.capture3("ruby", SCRIPT_PATH, dir)

      assert status.success?, failure_message(stdout, stderr)
    end
  end

  def test_validator_rejects_non_visual_files_as_screenshot_proof
    Dir.mktmpdir("page-catalog-invalid-screenshot") do |dir|
      create_entry(
        dir,
        "landing-page",
        screenshot_paths: {
          "desktop" => "entry.md",
          "mobile" => "screenshots/mobile.png"
        }
      )

      stdout, stderr, status = Open3.capture3("ruby", SCRIPT_PATH, dir)

      refute status.success?, "validator unexpectedly passed\n#{stdout}\n#{stderr}"
      assert_includes stdout + stderr, "screenshots.desktop"
    end
  end

  private

  def create_entry(
    root,
    slug,
    missing_fields: [],
    changelog_date: "2026-04-05",
    status: "draft",
    approved_by: nil,
    approved_on: nil,
    screenshot_paths: {
      "desktop" => "screenshots/desktop-draft.svg",
      "mobile" => "screenshots/mobile-draft.svg"
    }
  )
    entry_root = File.join(root, slug)
    screenshots_root = File.join(entry_root, "screenshots")
    figma_root = File.join(entry_root, "figma")
    FileUtils.mkdir_p(screenshots_root)
    FileUtils.mkdir_p(figma_root)

    File.write(File.join(entry_root, "entry.md"), "# #{slug}\n")
    File.write(File.join(figma_root, "README.md"), "Pending Figma source.\n")
    screenshot_paths.each do |_, relative_path|
      full_path = File.join(entry_root, relative_path)
      FileUtils.mkdir_p(File.dirname(full_path))
      File.write(full_path, "placeholder asset\n")
    end

    payload = {
      "id" => slug,
      "name" => slug.split("-").map(&:capitalize).join(" "),
      "version" => "v0.1.0",
      "status" => status,
      "owner" => "Aphrodite",
      "approved_by" => approved_by,
      "approved_on" => approved_on,
      "intended_use" => "Use this entry for testing.",
      "non_goals" => ["Do not use as a fixture for other concerns."],
      "ux_rationale" => "Keeps the validator contract honest.",
      "allowed_variations" => ["Headline copy"],
      "required_sections" => ["Hero"],
      "screenshots" => screenshot_paths,
      "figma_link" => "pending://add-before-preview",
      "changelog" => [
        {
          "version" => "v0.1.0",
          "date" => changelog_date,
          "changes" => "Initial fixture"
        }
      ]
    }

    missing_fields.each { |field| payload.delete(field) }
    File.write(File.join(entry_root, "entry.yaml"), YAML.dump(payload))
  end

  def failure_message(stdout, stderr)
    "validator failed unexpectedly\nstdout:\n#{stdout}\nstderr:\n#{stderr}"
  end
end
