# Task Worktree and Branch Map

## Current task mapping

- Task: `AGE-493`
- Repo workspace: `/Users/shakilakram/.paperclip/instances/default/projects/0c2bcc48-e0a3-4867-915f-ebcb17aec2dc/067646e5-5dbc-478a-be9e-27ac137c0756/_default/page-catalog`
- Active branch: `task/AGE-493-page-catalog-hardening`
- Remote: `origin git@github.com:agentarks/page-catalog.git`

## Why the repo root is the active worktree

This repo is already checked out inside a task-dedicated Paperclip execution workspace. AGE-493 continues in that dedicated checkout instead of creating a second nested worktree mid-task. Future concurrent tasks should prefer `.worktrees/<branch-name>` once the repo is being worked in by multiple active branches at the same time.

## Future convention

When a new isolated checkout is needed:

1. Create a branch from `origin/main`.
2. Create the worktree at `.worktrees/<branch-name>`.
3. Record the task -> worktree -> branch mapping in the issue and PR.
4. Remove the worktree after merge, abandonment, or supersession.
