# Settings Page

**Status:** Draft
**Version:** v0.1.0
**Owner:** Aphrodite

## What this is

A reusable configuration-page archetype for account, profile, and system settings where users need clarity, safe editing, and confidence about what will change.

## When to choose this

- The page is primarily about viewing or changing user or workspace preferences.
- The user needs grouped controls with clear save behavior.
- The experience benefits from stable information architecture and clear destructive-action separation.

## When not to choose this

- The page is actually a billing workflow, onboarding journey, or admin console.
- The surface is mostly operational data rather than editable settings.
- The interaction is a specialized trust-sensitive security flow that deserves its own archetype.

## Required sections

1. Settings navigation or grouping.
2. Section heading with short descriptive copy.
3. Grouped setting controls.
4. Save, cancel, or reset action area.
5. Separated destructive-action zone.

## Allowed variations

- Sidebar, tabs, or stacked sections depending on scope.
- Control density and helper-text level based on audience sophistication.
- Product-specific categories and ordering.

## Important states

- Loaded state with current preferences.
- Dirty state with unsaved changes.
- Saving state.
- Success confirmation.
- Validation failure.
- Empty or missing-data state.

## UX rationale

Users need control without fear. The pattern emphasizes findability, safe edit loops, and a clear line between routine configuration and destructive actions.

## Implementation notes

- Warn before navigation when there are unsaved changes.
- Keep destructive actions visually isolated and confirm them explicitly.
- Use inline validation instead of vague form-level failures.
- On mobile, preserve context so users understand which section they are changing.

## Review status

- Draft visual placeholders are installed in `screenshots/`.
- Figma source must be linked before Preview.
- Hephaestus reviews feasibility and reuse at Ready for Review.
- Calliope joins when trust or helper-copy language materially affects the pattern.
