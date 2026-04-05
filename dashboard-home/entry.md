# Dashboard Home

**Status:** Draft
**Version:** v0.2.0
**Owner:** Aphrodite

## What this is

A reusable authenticated home surface for products where returning users need immediate orientation: what matters now, what changed recently, and what action deserves attention first.

## When to choose this

- The product has repeat usage and meaningful work already in motion.
- Users need status, recency, and quick action choices on arrival after sign-in.
- The page is the default in-product home, not a temporary setup surface.

## When not to choose this

- The first screen should teach the product or drive first-run activation.
- The primary user need is deep analysis, long-form reporting, or settings management.
- The surface is mostly administration, approval workflow, or project-specific detail.

## Boundary with nearby archetypes

- Choose this instead of `onboarding-flow` when the user is already inside normal product usage and needs orientation, not guided activation.
- If the page only makes sense after a sequence of required setup steps, that is not a dashboard home yet.
- Do not let this become a dumping ground for every available module; the page should answer "what matters now?" before "what else exists?"

## Required sections

1. Global navigation or command bar that anchors the user in the product.
2. Orientation region with account, workspace, or status framing.
3. Priority actions block for the most time-sensitive or common next moves.
4. Recent activity or recency-based work module.
5. Progress, queue, or workload summary that shows what is in motion.
6. Optional lower-priority secondary modules only if they do not outrank the primary action path.

## Allowed variations

- Widget mix can change by product so long as status, recency, and action priority remain legible.
- Layout can shift from multi-column desktop to stacked mobile cards.
- Quick actions can be icon-led or label-led.
- Guidance or promotional modules are acceptable only when they do not crowd out live work.

## Important states

- Empty state for new users.
- Loading skeletons.
- Error state for failed modules.
- Populated day-to-day state.
- Onboarding-in-progress state.
- Permission-limited state when some modules are unavailable.
- Partial-data state when one module fails but the rest still load.

## UX rationale

Returning users arrive with intent. A good dashboard home reduces hunting by putting current status, likely next actions, and recent work at the top. It fails when it behaves like a random widget board instead of a prioritization surface.

## Implementation notes

- Prefer independently loading modules so one slow widget does not block the page.
- Preserve last-used context only when it genuinely helps orientation.
- Mobile behavior should prioritize actionability over perfect layout parity.
- Avoid turning the dashboard into a dumping ground for every metric.
- New-user and returning-user states may need different module emphasis, but they should still feel like the same page class.

## Review status

- Draft visual placeholders are installed in `screenshots/`.
- Canonical Figma source is still missing and must be attached before this entry can leave Draft.
- Hephaestus reviews feasibility and reusability at Ready for Review.
- Calliope joins when message hierarchy or trust language materially changes the archetype.
- Recommendation: stay Draft. The boundary with onboarding is stronger now, but the state model and module variability still need more structural proof alongside a canonical Figma source.
