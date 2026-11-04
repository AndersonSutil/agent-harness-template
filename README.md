# agent-harness-template

A small, opinionated starting point for working with AI coding agents.
It does not ship any agent. It ships the **harness** around one:

> Agent = model + harness. The model changes every few months. The harness stays in your repo.

- **Guides** (before the agent acts): `AGENTS.md`, `docs/spec.md`, `docs/tasks.md`
- **Sensors** (after the agent acts): `make verify`, CI, gitleaks, PR template
- **Memory** (between sessions): `docs/changes.md`, `docs/errors.md`

## Structure

```
.
├── AGENTS.md                      # map for the agent: where things are, verify, never, flow
├── Makefile                       # `make verify` = the single gate (wire your tests/lint here)
├── docs/
│   ├── spec.md                    # what, why, requirements, interfaces, OUT OF SCOPE
│   ├── tasks.md                   # one task = one acceptance criterion + one verify command
│   ├── changes.md                 # what changed, one line per task
│   └── errors.md                  # what broke, root cause, fix (agent mistakes included)
├── .github/
│   ├── pull_request_template.md   # asks for task id and verify output
│   └── workflows/verify.yml       # runs `make verify` + gitleaks on every PR
├── .pre-commit-config.yaml        # gitleaks before every commit
├── .gitignore
└── LICENSE
```

## How to use

1. Click **Use this template** (or clone and delete `.git`).
2. Wire `make verify` in the `Makefile` to your real checks (tests, lint, type check).
   Until you do, it passes with a warning so the template stays green.
3. Install the secret scanner hook:
   ```bash
   pipx install pre-commit   # or: pip install pre-commit
   pre-commit install
   ```
4. Fill `docs/spec.md` (keep it to one page, and do not skip **Out of scope**).
5. Break the spec into tasks in `docs/tasks.md`. Every task needs a command that proves it is done.
6. Point your agent at `AGENTS.md` (most coding agents read it automatically).
7. Work one task per branch: implement → `make verify` → PR → update `docs/changes.md`.
8. When the same mistake happens twice, fix the harness (a test, a lint rule, a line in `AGENTS.md`), not the prompt.

## Recommended GitHub settings

These live outside the repo, so set them by hand:

- Protect `main`: require PRs and the `verify` check to pass; block force-push.
- Give the agent a token that can open PRs but cannot push to `main`.
- Keep secrets in GitHub Actions secrets or a secret manager, never in the repo.

## Further reading

- OpenAI, *Harness engineering: leveraging Codex in an agent-first world*: https://openai.com/index/harness-engineering/
- Anthropic, *Effective harnesses for long-running agents*: https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
- Birgitta Böckeler, *Harness engineering for coding agent users*: https://martinfowler.com/articles/harness-engineering.html

## Português (resumo)

Template pequeno pra trabalhar com agentes de código. Não traz agente nenhum; traz o **harness** (o arreio) em volta dele:

- **Guias:** `AGENTS.md` (mapa), `docs/spec.md` (com **fora de escopo**), `docs/tasks.md` (critério verificável por comando).
- **Sensores:** `make verify`, CI no PR, gitleaks no pre-commit.
- **Memória:** `docs/changes.md` e `docs/errors.md`.

Como usar: use o template, ligue o `make verify` nos seus testes/lint, rode `pre-commit install`, preencha a spec e as tasks, e trabalhe uma task por branch. Erro repetido? Conserta o harness, não o prompt.

## License

MIT © 2026 Anderson Sutil
