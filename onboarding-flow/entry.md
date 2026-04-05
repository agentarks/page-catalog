# Onboarding Flow

**Status:** Draft
**Version:** v0.1.0
**Owner:** Aphrodite

## What this is

A reusable first-run flow archetype for products that need to orient new users, collect setup details, and get them to an early win without overwhelming them.

## When to choose this

- The product has enough setup or teaching complexity that a user needs guided first-run structure.
- The first meaningful action is more likely to happen after brief orientation.
- The business cares about activation quality, not just account creation.

## When not to choose this

- The product is simple enough to enter directly.
- Guidance is better delivered as lightweight in-context help.
- The flow is primarily transactional rather than educational or setup-oriented.

## Required sections

1. Welcome or expectation-setting step.
2. Setup or configuration step.
3. Guided explanation of product value or behavior.
4. First meaningful action prompt.
5. Completion state with next-step guidance.

## Allowed variations

- Step count and grouping by product complexity.
- Progress indicator style.
- Optional step handling.
- Level of inline instructional content.

## Important states

- Current step in progress.
- Completed step.
- Optional-step skip state.
- Error or interrupted-resume state.
- Completion state.

## UX rationale

Users keep going when progress feels real. This pattern makes orientation tangible and avoids a front-loaded wall of explanation by breaking the experience into achievable steps.

## Implementation notes

- Show where the user is in the flow at all times.
- Persist progress so the flow can resume safely.
- Avoid requiring permissions too early unless they are essential.
- Mobile should feel native and focused, not like a squeezed desktop wizard.

## Review status

- Draft visual placeholders are installed in `screenshots/`.
- Figma source must be linked before Preview.
- Hephaestus reviews technical feasibility at Ready for Review.
- Calliope reviews message-heavy steps when onboarding language materially affects trust or activation.
