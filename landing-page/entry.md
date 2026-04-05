# Landing Page

**Status:** Draft
**Version:** v0.1.0
**Owner:** Aphrodite

## What this is

A reusable marketing page archetype for top-of-funnel acquisition surfaces where a visitor needs to understand the offer fast, trust it enough to keep reading, and move toward one clear action.

## When to choose this

- A project needs a homepage or campaign page focused on value communication and conversion.
- The page is aimed at first-time visitors who do not yet know the product.
- Trust, differentiation, and CTA clarity matter more than dense product depth.

## When not to choose this

- The page is primarily for authenticated users.
- The page needs pricing-table depth or product-comparison density.
- The experience is a focused single-offer CTA page with narrower scope than a landing page.

## Required sections

1. Hero with headline, subheadline, and primary CTA.
2. Trust signal block near the top of the page.
3. Feature or value highlight section.
4. Social proof or supporting evidence block.
5. Repeated CTA before the footer.
6. Footer with legal and navigation basics.

## Allowed variations

- Hero media can be static or motion-based if readability stays strong.
- Trust signals can use logos, quotes, stats, or a compact mix.
- Value blocks can be reordered when the strongest evidence changes.
- CTA wording can change by campaign.

## Important states

- Default loaded state.
- Mobile stacked layout.
- CTA hover and active states.
- Dynamic-content loading or fallback state when used with live modules.

## UX rationale

Visitors decide quickly whether a page is worth their attention. This pattern sequences comprehension, trust, and action so the page does not ask for conversion before it has earned it.

## Implementation notes

- Keep above-the-fold copy readable before media loads.
- Repeat the main CTA at logical decision points instead of inventing secondary actions.
- Preserve strong contrast and mobile thumb reach for CTA blocks.
- Instrument scroll depth and CTA interaction when the project needs measurement.

## Review status

- Draft visual placeholders are installed in `screenshots/`.
- Figma source must be linked before Ready for Review advances to Preview.
- Hephaestus reviews feasibility at Ready for Review.
- Calliope reviews messaging fit when the live copy direction materially affects the archetype.
