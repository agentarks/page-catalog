# Auth / Sign-In Surface

**Status:** Draft
**Version:** v0.1.0
**Owner:** Aphrodite

## What this is

A reusable authentication-entry archetype for login, signup, and recovery surfaces where trust, clarity, and low-friction form behavior matter more than visual novelty.

## When to choose this

- The page's primary purpose is authenticating or identifying a user.
- The experience needs a stable, reusable front-door pattern across projects.
- Trust signals and helpful error handling materially affect conversion.

## When not to choose this

- The surface is primarily an admin or SSO-management console.
- The flow is account settings rather than authentication entry.
- The work is mainly a security operations or fraud workflow.

## Required sections

1. Clear auth-intent heading.
2. Primary form.
3. Secondary recovery or alternate-path links.
4. Trust or policy references.

## Allowed variations

- Centered or split-screen layout.
- Magic-link, password, or social-auth first strategies.
- Signup-specific password-strength or helper-copy treatments.
- Provider mix for third-party auth.

## Important states

- Default entry state.
- Submitting state.
- Validation or credential failure.
- Redirect or success state.
- Password-visibility toggle.

## UX rationale

This is the gate into the product. Users should understand what to do instantly, recover from errors without feeling punished, and trust the product enough to continue.

## Implementation notes

- Prevent double submission and show form feedback immediately.
- Treat credential errors carefully so the UI does not reveal account enumeration details.
- Keep secondary links visible but visually subordinate.
- Mobile should keep the form easy to complete with minimal scrolling.

## Review status

- Draft visual placeholders are installed in `screenshots/`.
- Figma source must be linked before Preview.
- Hephaestus reviews technical feasibility and auth-implementation practicality at Ready for Review.
- Calliope reviews trust, CTA, and recovery language when message quality materially affects the pattern.
