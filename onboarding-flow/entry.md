# Onboarding Flow

**Status:** Draft
**Version:** v0.2.0
**Owner:** Aphrodite

## What this is

A reusable first-run activation flow archetype for products that need to orient new users, collect essential setup inputs, and move them to a meaningful first success without overwhelming them.

## When to choose this

- The product needs a guided first-run sequence before normal usage makes sense.
- The first meaningful action is more likely after a short series of setup or teaching steps.
- Activation quality matters more than minimizing every click at all costs.

## When not to choose this

- The product is simple enough to enter directly after sign-in.
- Guidance is better delivered as lightweight in-context help inside the normal product shell.
- The flow is primarily transactional, compliance-heavy, or account-recovery oriented.

## Boundary with nearby archetypes

- Choose this instead of `dashboard-home` when the user is not yet in steady-state product usage and still needs guided activation.
- Do not use this for one-step account entry or password recovery; that belongs with `auth-signin`.
- The flow should end by handing the user into the product, not by becoming a permanent wrapper around normal work.

## Required sections

1. Expectation-setting entry step that says what will happen and how long it should take.
2. Visible progress model so the user knows where they are and what remains.
3. Current-step content area for setup, configuration, or education.
4. Support or rationale area when the user needs extra context to continue confidently.
5. Forward, back, and skip behavior that matches the step's importance.
6. Completion handoff that points clearly into the next real product surface.

## Allowed variations

- Step count and grouping can vary by product complexity.
- Progress indicator style can be simple or milestone-based.
- Optional-step handling can vary so long as skipped work is still understandable later.
- Inline instructional depth can change based on user sophistication.

## Important states

- Current step in progress.
- Completed step.
- Optional-step skip state.
- Error or interrupted-resume state.
- Completion state.
- Validation-blocked state.
- Permission-request state when a later product capability depends on access.
- Resume state after leaving and returning mid-flow.

## UX rationale

Users continue when progress feels real and the cost of continuing is understandable. This pattern makes the setup journey tangible, keeps the user oriented, and converts explanation into small commitments instead of a front-loaded lecture.

## Implementation notes

- Show where the user is in the flow at all times.
- Persist progress so the flow can resume safely.
- Avoid requiring permissions too early unless they are essential.
- Mobile should feel native and focused, not like a squeezed desktop wizard.
- Completion should hand off into the actual product surface immediately; do not end on a dead-end celebration screen.

## Review status

- Draft visual placeholders are installed in `screenshots/`.
- Canonical Figma source is still missing and must be attached before this entry can leave Draft.
- Hephaestus reviews technical feasibility at Ready for Review.
- Calliope reviews message-heavy steps when onboarding language materially affects trust or activation.
- Recommendation: stay Draft. This still needs stronger step-by-step state definition and a canonical Figma source before review is credible.
