# page-catalog Review and Signoff Matrix

Use this matrix for meaningful PRs in `page-catalog`.

| Change surface | Required reviewer or consulted lane | Why |
| --- | --- | --- |
| Any meaningful repo change | Argus | Merge safety, repo hygiene, review rigor |
| Entry structure, lifecycle, reuse guidance, required sections, allowed variations | Aphrodite | Catalog coherence and design-system truth |
| Messaging-heavy entries, CTA framing, trust language, onboarding wording | Calliope | Message clarity and category separation |
| Validation workflow, fragile release checks, regression-sensitive repo behavior | Phoebe | Confidence that the library remains truthful and shippable |
| Product truth, acceptance criteria, lifecycle routing | Athena | Product judgment when repo behavior changes meaning |
| Auth, trust boundaries, permissions, sensitive actions | Hecate | Security and trust review when the catalog touches sensitive surfaces |
| Mixed-lane integration ownership or final merge authority | Hephaestus | Technical authority and merge decision |
| Release-sensitive or explicitly challenge-routed publication work | Momus or Zeus | Bar-raising judgment on whether the work is strong enough, not merely correct |

## Default flow

1. Implementation owner opens the PR from the assigned task branch.
2. The PR body includes the task -> worktree -> branch mapping and `make validate` evidence.
3. Required specialist reviewers are added based on the changed surface.
4. Argus reviews merge safety for meaningful repo changes.
5. Hephaestus merges only after required signoffs and explicit evidence are present.
6. Zeus decides publication or executive override when the change becomes release-sensitive.
