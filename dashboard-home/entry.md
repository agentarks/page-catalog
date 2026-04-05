# Dashboard Home

**Status:** Draft
**Version:** v0.1.0
**Owner:** Aphrodite

## What this is

A reusable authenticated homepage archetype for products where users need a fast sense of current status, recent activity, and the shortest path to their next task.

## When to choose this

- The product has recurring user sessions and meaningful work in progress.
- Users benefit from recent activity, quick actions, and at-a-glance status in one place.
- The app needs a stable first screen after login.

## When not to choose this

- The first screen is a setup wizard or onboarding journey.
- The primary user need is deep data exploration rather than task orientation.
- The page is mostly settings, administration, or reporting.

## Required sections

1. Top navigation or command bar.
2. Welcome or status region.
3. Quick actions block.
4. Recent activity or work recency block.
5. Progress, queue, or work summary.

## Allowed variations

- Widget mix changes by product.
- Layout can collapse from multi-column desktop to stacked mobile cards.
- Quick actions can be icon-led or label-led.
- Guidance or promo panels can be inserted when justified.

## Important states

- Empty state for new users.
- Loading skeletons.
- Error state for failed modules.
- Populated day-to-day state.
- Onboarding-in-progress state.

## UX rationale

Returning users arrive with intent. This pattern minimizes hunting by putting status, next actions, and recency near the top rather than scattering them behind navigation.

## Implementation notes

- Prefer independently loading modules so one slow widget does not block the page.
- Preserve last-used context only when it genuinely helps orientation.
- Mobile behavior should prioritize actionability over perfect layout parity.
- Avoid turning the dashboard into a dumping ground for every metric.

## Review status

- Draft visual placeholders are installed in `screenshots/`.
- Figma source must be linked before Preview.
- Hephaestus reviews feasibility and reusability at Ready for Review.
- Calliope joins when message hierarchy or trust language materially changes the archetype.
