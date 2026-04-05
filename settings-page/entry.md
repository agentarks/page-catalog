# Settings Page

**Status:** Draft
**Version:** v0.2.0
**Owner:** Aphrodite

## What this is

A reusable configuration page archetype for account, profile, workspace, and product preferences where users need stable information architecture, safe edits, and confidence about what will change.

## When to choose this

- The page is primarily for viewing or editing user, workspace, or product preferences.
- Users need grouped controls, clear save behavior, and visible consequences.
- The experience benefits from persistent navigation and separated destructive actions.

## When not to choose this

- The surface is mainly a billing workflow, admin console, or operational report.
- The content is mostly read-only data rather than editable settings.
- The interaction is a specialized trust-sensitive credential or recovery flow that deserves its own archetype.

## Boundary with nearby archetypes

- Choose this instead of `auth-signin` when the user is already inside the product and modifying ongoing preferences rather than proving identity.
- Do not collapse billing management, seat administration, or security operations into a generic settings bucket when those tasks need stronger trust or workflow handling.
- This page should feel stable and explorable, not step-based like `onboarding-flow`.

## Required sections

1. Page title and scope framing so the user knows which account, workspace, or area they are editing.
2. Settings navigation or grouping mechanism that makes the current section obvious.
3. Section header with short descriptive copy for the active group.
4. Grouped controls with inline helper text and validation where needed.
5. Save behavior that makes dirty state, success, and reset/cancel affordances clear.
6. Visually separated destructive-action region that does not compete with routine edits.

## Allowed variations

- Sidebar, tabs, or stacked sections depending on scope.
- Control density and helper-text level can vary by product sophistication.
- Product-specific categories and ordering are acceptable if destructive actions remain isolated.

## Important states

- Loaded state with current preferences.
- Dirty state with unsaved changes.
- Saving state.
- Success confirmation.
- Validation failure.
- Empty or missing-data state.
- Permission-limited state for read-only users.
- Per-section save success when the page supports segmented persistence.

## UX rationale

Users come to settings to make controlled changes, not to decipher product architecture. The page succeeds when discovery is easy, edits feel reversible or well-signposted, and dangerous actions never masquerade as routine controls.

## Implementation notes

- Warn before navigation when there are unsaved changes.
- Keep destructive actions visually isolated and confirm them explicitly.
- Use inline validation instead of vague form-level failures.
- On mobile, preserve context so users understand which section they are changing.
- Avoid mixing rarely used emergency actions into the same action row as ordinary saves.

## Review status

- Draft visual placeholders are installed in `screenshots/`.
- Canonical Figma source is still missing and must be attached before this entry can leave Draft.
- Hephaestus reviews feasibility and reuse at Ready for Review.
- Calliope joins when trust or helper-copy language materially affects the pattern.
- Recommendation: stay Draft. This is structurally closest to Ready for Review, but it still lacks the required canonical Figma source.
