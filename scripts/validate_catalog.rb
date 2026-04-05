#!/usr/bin/env ruby

require "date"
require "pathname"
require "yaml"

class CatalogValidator
  SCREENSHOT_EXTENSIONS = %w[.png .jpg .jpeg .webp .svg .avif].freeze

  ENTRY_FILES = [
    "entry.yaml",
    "entry.md",
    "figma/README.md"
  ].freeze

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

  SUPPORT_DIRS = %w[docs scripts test .github].freeze

  def initialize(root)
    @root = Pathname(root).expand_path
    @errors = []
  end

  def run
    validate_root
    entry_directories.each { |entry_dir| validate_entry(entry_dir) } if @errors.empty?

    if @errors.empty?
      puts "Catalog validation passed for #{entry_directories.size} entr#{entry_directories.size == 1 ? 'y' : 'ies'}."
      true
    else
      warn "Catalog validation failed:"
      @errors.each { |error| warn "- #{error}" }
      false
    end
  end

  private

  def validate_root
    @errors << "Root path does not exist: #{@root}" unless @root.exist?
    return unless @errors.empty?

    @errors << "No catalog entry directories found in #{@root}" if entry_directories.empty?
  end

  def entry_directories
    @entry_directories ||= @root.children.select(&:directory?).reject do |child|
      child.basename.to_s.start_with?(".") || SUPPORT_DIRS.include?(child.basename.to_s)
    end.sort_by(&:to_s)
  end

  def validate_entry(entry_dir)
    missing_files = ENTRY_FILES.reject { |relative_path| entry_dir.join(relative_path).file? }
    missing_files.each do |relative_path|
      @errors << "#{entry_dir.basename}: missing #{relative_path}"
    end
    return unless missing_files.empty?

    data = YAML.safe_load(entry_dir.join("entry.yaml").read, permitted_classes: [Date], aliases: false)
    unless data.is_a?(Hash)
      @errors << "#{entry_dir.basename}: entry.yaml must contain a mapping"
      return
    end

    missing_fields = REQUIRED_FIELDS.reject { |field| data.key?(field) }
    missing_fields.each do |field|
      @errors << "#{entry_dir.basename}: missing field #{field}"
    end

    validate_value(entry_dir, data, "id") { |value| value == entry_dir.basename.to_s }
    validate_value(entry_dir, data, "non_goals") { |value| value.is_a?(Array) && !value.empty? }
    validate_value(entry_dir, data, "allowed_variations") { |value| value.is_a?(Array) && !value.empty? }
    validate_value(entry_dir, data, "required_sections") { |value| value.is_a?(Array) && !value.empty? }
    validate_value(entry_dir, data, "changelog") { |value| value.is_a?(Array) && !value.empty? }
    validate_screenshots(entry_dir, data["screenshots"])
  rescue Psych::Exception => e
    @errors << "#{entry_dir.basename}: invalid YAML (#{e.message})"
  end

  def validate_value(entry_dir, data, field)
    return unless data.key?(field)
    return if yield(data[field])

    @errors << "#{entry_dir.basename}: invalid #{field}"
  end

  def validate_screenshots(entry_dir, value)
    unless value.is_a?(Hash)
      @errors << "#{entry_dir.basename}: invalid screenshots"
      return
    end

    screenshots_root = entry_dir.join("screenshots")

    %w[desktop mobile].each do |viewport|
      relative_path = value[viewport]
      unless relative_path.is_a?(String) && !relative_path.empty?
        @errors << "#{entry_dir.basename}: invalid screenshots.#{viewport}"
        next
      end

      screenshot_path = entry_dir.join(relative_path).cleanpath
      unless screenshot_path.to_s.start_with?(entry_dir.to_s + File::SEPARATOR) || screenshot_path == entry_dir
        @errors << "#{entry_dir.basename}: screenshots.#{viewport} must stay within the entry directory"
        next
      end

      unless screenshot_path.to_s.start_with?(screenshots_root.to_s + File::SEPARATOR)
        @errors << "#{entry_dir.basename}: screenshots.#{viewport} must resolve under screenshots/"
        next
      end

      unless SCREENSHOT_EXTENSIONS.include?(screenshot_path.extname.downcase)
        @errors << "#{entry_dir.basename}: screenshots.#{viewport} must use an image file extension"
        next
      end

      @errors << "#{entry_dir.basename}: missing #{relative_path}" unless screenshot_path.file?
    end
  end
end

root = ARGV.fetch(0, Dir.pwd)
exit(CatalogValidator.new(root).run ? 0 : 1)
