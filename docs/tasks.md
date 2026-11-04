# Tasks

Rules:
- One task = one branch = one PR.
- Every task has an acceptance criterion (AC) and a **verify command** that exits 0 only when the AC holds.
- Status starts as `failing`. Move to `passing` only with the verify output in the PR.
- If you can't write the verify command, the task isn't ready: fix the spec first.

## Template

```markdown
## T<n>.<m> <short title>
- Spec: R<k> in docs/spec.md
- AC: <observable result, e.g. "EN in → EN out">
- Verify: `<command that proves it, e.g. go test ./bot -run TestReplyLanguage>`
- Status: failing
```

## Backlog

<!-- EXAMPLE, delete when you add real tasks -->
## T1.1 Health endpoint returns 200 (EXAMPLE)
- Spec: R1 in docs/spec.md
- AC: `GET /health` returns HTTP 200 with body `ok`
- Verify: `go test ./... -run TestHealth` (use your stack's equivalent)
- Status: failing
