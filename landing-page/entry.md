# Landing Page

**Status:** Draft
**Version:** v0.2.0
**Owner:** Aphrodite

## What this is

A reusable top-of-funnel acquisition page archetype for broad product or campaign entry points. The job is to help a first-time visitor understand what the product is, why it matters, and why it is credible before asking for a meaningful next step.

## When to choose this

- The page is the main public entry point for a product, feature family, or broad campaign.
- The visitor is still deciding whether the offer deserves more attention.
- The experience needs room for positioning, proof, and at least one repeat conversion prompt.

## When not to choose this

- The surface is primarily for authenticated users or operational workflows.
- The page is mostly pricing-table depth, dense product comparison, or long-form content.
- The intent is a narrower single-offer push where the user already has context and a tighter CTA page is the better fit.

## Boundary with nearby archetypes

- Choose this instead of `marketing-cta` when the page must introduce the product category, establish trust, and explain why the offer matters before conversion.
- Do not let this collapse into a content-light campaign page whose entire logic is one fast ask. That is `marketing-cta`.
- Do not use this as a surrogate pricing page, docs homepage, or authenticated shell.

## Required sections

1. Lightweight top navigation with one dominant CTA and no competing action set.
2. Hero section that frames the product, category, and primary promise in plain language.
3. Early trust band with logos, proof points, or credibility markers placed before deep scrolling.
4. Value explanation section that shows what the product does or why it is different.
5. Proof section with testimonials, outcomes, examples, or evidence that reduces hesitation.
6. Repeated CTA after the page has earned it, not before the value proposition is legible.
7. Footer with legal, support, and basic navigation escape hatches.

## Allowed variations

- Hero media can be static or motion-based if the headline remains primary.
- Trust can be expressed through logos, testimonials, metrics, certifications, or a compact mix.
- The explanatory middle of the page can lean more narrative or more product-led depending on the offer.
- CTA wording and destination can shift by campaign so long as the page still resolves to one primary ask.

## Important states

- Default loaded state.
- Mobile stacked layout.
- CTA hover and active states.
- Dynamic-content loading or fallback state when live modules power social proof or metrics.
- Long-page anchor navigation behavior when the page includes deeper sections.

## UX rationale

Visitors make a fast relevance decision. This pattern earns the ask in sequence: orientation first, trust second, evidence third, conversion fourth. That sequence is what separates a credible landing page from a thin CTA blast.

## Implementation notes

- Keep above-the-fold copy readable before media loads.
- Repeat the main CTA at logical decision points instead of inventing a menu of secondary asks.
- Preserve strong contrast and mobile thumb reach for CTA blocks.
- If a project adds deeper navigation, keep it subordinate to the primary conversion path.
- Instrument scroll depth and CTA interaction when the project needs measurement.

## Review status

- Draft visual placeholders are installed in `screenshots/`.
- Canonical Figma source is still missing and must be attached before this entry can leave Draft.
- Hephaestus reviews feasibility at Ready for Review.
- Calliope reviews messaging fit when the live copy direction materially affects the archetype.
- Recommendation: stay Draft. Structurally this is close to Ready for Review, but the missing canonical Figma source blocks advancement.
