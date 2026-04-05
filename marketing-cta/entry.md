# Marketing / CTA Page

**Status:** Draft
**Version:** v0.2.0
**Owner:** Aphrodite

## What this is

A reusable conversion-focused marketing archetype for pages with one primary ask, where the visitor already has enough context that the page can stay narrower, shorter, and more forceful than a broad landing page.

## When to choose this

- The page has one dominant conversion target and little need for broad storytelling.
- The visitor is arriving from an ad, email, launch, or other source that already supplied context.
- The page benefits from limited scope, minimal navigation, and tight message hierarchy.

## When not to choose this

- The page needs broad brand introduction, category framing, or multi-section storytelling.
- The visitor still needs pricing comparison or deep product education.
- The surface is really a homepage, editorial page, or content hub.

## Boundary with nearby archetypes

- Choose this instead of `landing-page` when the user already understands the category and only needs enough proof to take one focused action.
- Do not broaden this into a homepage with multiple competing paths, navigation depth, or several equally important CTAs.
- If the page must explain the company or product at length before asking for action, it is a landing page, not a CTA page.

## Required sections

1. Focused above-the-fold value statement with one primary CTA and minimal navigation.
2. Immediate supporting proof or visual context that confirms the promise quickly.
3. Benefits, objection-handling, or risk-reduction section tied directly to the primary ask.
4. Trust reinforcement placed near the conversion point, not buried low on the page.
5. Repeated CTA only when the user has been given enough proof to act.

## Allowed variations

- Copy-led or visual-led top section.
- Trust treatment via testimonials, logos, or metrics.
- Optional FAQ or risk-reduction block.
- Optional lower-commitment secondary CTA if it does not compete with the primary ask.

## Important states

- Default loaded state.
- Video or demo-playing state if media is present.
- CTA hover and active states.
- Mobile stacked state.
- Sticky CTA behavior when the page is long enough to justify it.

## UX rationale

The narrower the objective, the less room there is for distraction. This pattern keeps promise, proof, and action close together so the user does not have to reorient across a broad marketing narrative before deciding.

## Implementation notes

- Keep the primary CTA visible early and repeat only when it clarifies the flow.
- Use proof near the conversion point, not buried below generic filler.
- Avoid extra navigation that competes with the action path.
- Mobile should keep the action comfortably reachable without losing proof context.
- If the page introduces too many secondary branches, it has outgrown this archetype.

## Review status

- Draft visual placeholders are installed in `screenshots/`.
- Canonical Figma source is still missing and must be attached before this entry can leave Draft.
- Hephaestus reviews feasibility at Ready for Review.
- Calliope reviews headline hierarchy, CTA framing, and trust language at Ready for Review.
- Recommendation: stay Draft. The narrower boundary is clearer now, but this remains message-sensitive and still lacks a canonical Figma source.
