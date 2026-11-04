# AGENTS.md

Short on purpose. This is a map, not a manual. Follow the links.

## Where things are
- Spec: `docs/spec.md` (read "Out of scope" before changing anything)
- Tasks: `docs/tasks.md` (pick ONE task with status `failing`)
- Memory: `docs/changes.md` (what changed), `docs/errors.md` (what broke and why)

## Verify
- `make verify` runs every gate. It must pass before you open a PR.
- Each task in `docs/tasks.md` has its own verify command. Run it and paste the output in the PR.

## Never
- Push to `main`, force-push, or rewrite published history.
- Commit secrets, `.env` files, tokens or credentials.
- Change anything listed under "Out of scope" in `docs/spec.md`.
- Disable, skip or weaken a test or check to make it pass.
- Run destructive commands (deleting data, deploys, migrations) without explicit human approval.

## Flow
1. `git switch -c task/<id>-<short-name>`
2. Implement one task. Keep the diff small.
3. `make verify` + the task's verify command.
4. Update `docs/changes.md` (and `docs/errors.md` if something broke).
5. Open a PR using the template. Mark the task `passing` only with evidence.

## When stuck
Stop and ask. Write what you tried in the PR description instead of guessing.
