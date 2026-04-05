# page-catalog

A git repo of reusable page archetypes for new AgentArks projects.

Published tags are the stable source of truth for downstream consumers. `main` remains draft and integration history until entries clear review and release.

**The goal**: when starting a new project, pick the closest published page from the library, adapt it within the allowed variation surface, and ship without inventing a parallel pattern.

---

## Library Structure

```
page-catalog/
├── README.md
├── .github/
│   └── PULL_REQUEST_TEMPLATE.md
├── docs/
│   ├── company-git-delivery-policy.md
│   ├── company-review-signoff-matrix.md
│   └── worktree-and-branch-map.md
├── Makefile
├── scripts/
│   └── validate_catalog.rb
├── test/
│   └── validate_catalog_test.rb
├── landing-page/
│   ├── entry.yaml          # structured metadata
│   ├── entry.md            # human-readable: when to use, when not to, UX rationale
│   ├── screenshots/        # desktop + mobile draft or approved proof
│   └── figma/              # Figma source link
├── dashboard-home/
│   └── ...
├── settings-page/
│   └── ...
├── onboarding-flow/
│   └── ...
├── auth-signin/
│   └── ...
└── marketing-cta/
    └── ...
```

---

## Entry Schema

Each page entry lives in its own directory and must include:

**`entry.yaml`** — structured metadata:

```yaml
id: landing-page
name: Landing Page
version: v1.0
status: published
owner: Aphrodite
approved_by: <board-member>
approved_on: 2026-04-03
intended_use: >
  Marketing sites, campaign pages, and any page whose primary goal
  is to communicate value and convert visitors to a CTA.
non_goals: >
  Not for authenticated app surfaces, dashboards, or settings.
  Not for pages where the user already has context.
allowed_variations:
  - Hero headline and subheadline copy
  - CTA button text and destination
  - Number and type of value-prop sections
  - Social proof placement
  - Footer structure
required_sections:
  - Hero with headline + subheadline + primary CTA
  - Value proposition section
  - Social proof or trust signals
  - Footer
screenshots:
  desktop: screenshots/landing-page-desktop-v1.png
  mobile: screenshots/landing-page-mobile-v1.png
figma_link: https://figma.com/file/...
changelog:
  - version: v1.0
    date: 2026-04-03
    changes: initial approved version
```

**`entry.md`** — human-readable entry:

```md
# Landing Page — v1.0

## What this is
[one paragraph: the page archetype, what it solves]

## When to choose this
- [bullet list of fit conditions]

## When NOT to choose this
- [bullet list of non-fit conditions]

## UX Rationale
[why this pattern works for the target user and business goal]

## Structure
[required sections, their order, and why]

## Allowed Variations
[what a project may customize without proposing a new entry]

## Implementation Notes
[Athena/Aphrodite/Apollo notes on structure, component inventory, gotchas]
```

**`screenshots/`** — current approved visual proof (desktop + mobile)

**`figma/`** — Figma source link or embed

---

## Validation

Run one command before opening or updating a meaningful PR:

```bash
make validate
```

That command runs:

- `ruby test/validate_catalog_test.rb`
- `ruby scripts/validate_catalog.rb .`

The validator checks every catalog entry for:

- required repo files: `entry.yaml`, `entry.md`, `figma/README.md`, and the screenshot assets declared in `entry.yaml`
- required metadata fields in `entry.yaml`
- basic metadata shape plus valid `screenshots.desktop` / `screenshots.mobile` paths that stay inside the entry directory

## Lifecycle

Every entry follows this status flow:

```
Draft → Ready for Review → Preview → Approved → Published → Superseded / Deprecated
```

- **Draft** — Aphrodite is building or shaping the entry; screenshot/mockup in progress
- **Ready for Review** — Aphrodite submits for review; Hephaestus reviews for technical feasibility; Calliope reviews copy/messaging when relevant
- **Preview** — all prior reviews complete; ready for board review
- **Approved** — board signed off; entry goes into the library at next release
- **Published** — tagged release; available for project consumption
- **Superseded** — replaced by a newer published version
- **Deprecated** — should not be chosen for new work

**Review gate sequence**:

```
Draft
  → Ready for Review
  → [Hephaestus tech review + Calliope copy review if relevant]
  → Preview
  → [Board approval]
  → Approved
  → [Aphrodite merges + tags release]
  → Published
```

Entries do not reach Preview without passing the Hephaestus/Calliope gate. Entries do not get Published without explicit board sign-off.

---

## Versioning

Published entries are stable. Improvements go through the lifecycle — no silent rewrites.

- **Minor versions** — copy changes, layout refinements, new allowed variations
- **Major versions** — structural changes, new required sections, changed IA

Releases are git tags:

```
page-catalog/v1.0.0  — initial published set
page-catalog/v1.1.0  — minor update to landing-page
page-catalog/v2.0.0  — new archetype; major revision of dashboard-home
```

Projects pin to a tag. `main` is always draft and should not be treated as a stable dependency surface.

---

## How a Project Uses the Library

### 1. Athena selects

Athena reviews the published library for the new project. She picks the closest entry if fit is good. She confirms fit with Aphrodite and Hephaestus if uncertain.

### 2. Apollo implements

Apollo takes the selected entry as the baseline for implementation:

- Reads `entry.yaml` and `entry.md` fully before starting
- Reviews Figma source and screenshots to align with approved visual direction
- Uses required sections as the structural baseline
- Customizes within allowed variations
- Flags immediately when project requirements conflict with required sections or exceed allowed variations
- Documents all deviations as project-specific exceptions in the working issue

### 3. Deviation handling

If a project needs changes beyond allowed variations:
- Apollo documents the deviation in the issue
- Athena evaluates whether it warrants a new catalog entry
- If yes, Aphrodite opens a Draft proposal through the lifecycle

If the same deviation appears across multiple projects, Apollo files it as a catalog improvement proposal with Aphrodite — this is how the library grows over time without every project becoming a one-off.

---

## Delivery Workflow

- Repo delivery policy: `docs/company-git-delivery-policy.md`
- Review routing matrix: `docs/company-review-signoff-matrix.md`
- Current task mapping and future worktree convention: `docs/worktree-and-branch-map.md`
- Meaningful PRs should use `.github/PULL_REQUEST_TEMPLATE.md`

## Roles

| Role | Responsibility |
|------|---------------|
| **Aphrodite** | Creates, maintains, and improves page entries |
| **Athena** | Selects the right entry for a project; routes new proposals |
| **Apollo** | Implements from the selected entry; flags when it doesn't fit |
| **Calliope** | Reviews entries where messaging, copy, or CTA framing matters |
| **Hephaestus** | Reviews for technical feasibility before Preview |
| **Board / human** | Approves entries before publication |
| **Zeus** | Enforces the reuse rule; holds release authority for major versions |

---

## How to Propose a New Entry

1. Create a directory under `page-catalog/<new-archetype>/`
2. Fill in `entry.yaml` and `entry.md` at Draft quality
3. Add screenshots at Draft quality (can be wireframes)
4. Open a PR with status: `Draft`
5. Move the entry to Ready for Review and request Hephaestus review plus Calliope review when messaging matters
6. Advance the review-complete entry to Preview and notify the board
7. After board approval, Aphrodite merges and tags a release

---

## Current Entries

Draft library entries installed in this repo:
- landing-page
- auth-signin
- settings-page
- onboarding-flow
- dashboard-home
- marketing-cta

These entries are still `draft` until they clear Ready for Review, Preview, board approval, and a tagged release.
