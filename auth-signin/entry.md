# Auth / Sign-In Surface

**Status:** Draft
**Version:** v0.2.0
**Owner:** Aphrodite

## What this is

A reusable authentication entry archetype for sign-in, sign-up, and recovery surfaces where users need immediate clarity, trustworthy cues, and low-friction form behavior at the product's front door.

## When to choose this

- The page's primary purpose is authenticating, identifying, or recovering a user.
- The experience needs a stable front-door pattern across projects.
- Trust cues, recovery options, and clear form behavior materially affect completion.

## When not to choose this

- The surface is primarily an admin or SSO-management console.
- The user is already authenticated and adjusting account settings.
- The work is mainly a security operations, fraud, or lockout-management workflow.

## Boundary with nearby archetypes

- Choose this instead of `settings-page` when the user is proving identity or regaining access, not changing long-lived preferences.
- Do not let this become an all-purpose security console. High-risk admin or fraud operations need their own pattern.
- Recovery and alternate-path links belong here only when they support the core auth job rather than pulling the page into a broader account-management flow.

## Required sections

1. Clear intent heading that says whether the user is signing in, signing up, or recovering access.
2. Primary form with the fewest fields necessary for the chosen auth strategy.
3. Secondary recovery or alternate-path links kept visible but subordinate.
4. Trust, policy, or support references that reduce hesitation without stealing focus.
5. Optional brand or reassurance panel when the experience benefits from extra context on desktop.

## Allowed variations

- Centered or split-screen layout.
- Magic-link, password, passkey, or social-auth-first strategies.
- Signup-specific strength guidance or helper copy.
- Provider mix for third-party auth.

## Important states

- Default entry state.
- Submitting state.
- Validation or credential failure.
- Redirect or success state.
- Password-visibility toggle.
- Rate-limited or retry-later state.
- SSO redirect or provider-return state.
- Recovery handoff state.

## UX rationale

This is the gate into the product. The pattern works when users know what to do immediately, can recover from predictable mistakes without feeling blamed, and see enough trust evidence to continue without friction or suspicion.

## Implementation notes

- Prevent double submission and show form feedback immediately.
- Treat credential errors carefully so the UI does not reveal account enumeration details.
- Keep secondary links visible but visually subordinate.
- Mobile should keep the form easy to complete with minimal scrolling.
- If brand or trust content appears beside the form on desktop, keep the form primary on mobile.

## Review status

- Draft visual placeholders are installed in `screenshots/`.
- Canonical Figma source is still missing and must be attached before this entry can leave Draft.
- Hephaestus reviews technical feasibility and auth-implementation practicality at Ready for Review.
- Calliope reviews trust, CTA, and recovery language when message quality materially affects the pattern.
- Recommendation: stay Draft. Structurally this is near Ready for Review, but the missing canonical Figma source blocks advancement.
