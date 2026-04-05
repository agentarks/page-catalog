# page-catalog Delivery Policy

This repo follows the company delivery model, adapted for a standalone reusable library.

The default path is:

task -> worktree or dedicated task checkout -> branch -> implementation-owner commits -> implementation-owner PR -> required specialist review -> challenge pass when triggered -> Hephaestus merge decision -> Zeus release or override decision when materially required

## Workspace rule

- Production-bound repo changes are written in an isolated task workspace for `page-catalog`.
- Personal agent folders are not the delivery surface for this repo.
- The repo root may serve as the active worktree only when the execution workspace is already dedicated to the current task, as it is for AGE-493.

## Worktree rule

- Every meaningful coding task must map to one isolated checkout.
- Preferred convention for future concurrent work is `.worktrees/<branch-name>`.
- `.worktrees/` is gitignored in this repo so future tasks can adopt that layout without polluting status.

## Base branch rule

- Start new task branches from `origin/main` unless Hephaestus directs otherwise.

## Branch rule

- Routine direct commits to `main` are forbidden.
- Branch names must use `task/<issue-key>-<slug>` or `fix/<issue-key>-<slug>`.
- Published tags, not branches, are the stable consumption surface for downstream projects.

## Task mapping rule

- Every meaningful change must make the task, checkout path, branch, and PR explicit.
- Use [worktree-and-branch-map.md](./worktree-and-branch-map.md) and the PR body to keep that mapping visible.

## Commit rule

- The implementation owner commits the code they wrote.
- Frontend-owned repo-hardening changes in this library are committed by Apollo unless reassigned by Hephaestus.

## PR rule

- The implementation owner opens the PR for their branch.
- Every meaningful PR must include:
  - issue or goal link
  - task -> worktree -> branch mapping
  - scope of change
  - affected lanes
  - key risks
  - validation evidence
  - required reviewers
  - release or rollback notes when relevant

Use the local template at `.github/PULL_REQUEST_TEMPLATE.md`.

## Review rule

- Argus is the default merge-safety reviewer for meaningful repo changes.
- Aphrodite is required when entry structure, catalog semantics, or reuse guidance changes.
- Calliope is required when messaging-heavy entries or CTA framing change materially.
- Phoebe is required when validation behavior or release confidence is materially affected.
- Hephaestus is the merge authority after required signoffs and evidence are explicit.

See [company-review-signoff-matrix.md](./company-review-signoff-matrix.md) for the review matrix.

## Merge rule

- Hephaestus is the default merge authority after required signoffs and validation evidence are present.

## Release rule

- `main` is draft and integration history, not the stable consumption source.
- Downstream projects consume published tags such as `page-catalog/v1.0.0`.
- Zeus remains the release authority for materially sensitive publication decisions.

## Cleanup rule

- After merge, abandonment, or supersession, remove any task-specific worktree cleanly.
- Update [worktree-and-branch-map.md](./worktree-and-branch-map.md) when ownership or checkout layout changes.
