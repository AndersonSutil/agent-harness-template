# Single entry point for every gate. CI and agents run `make verify`.
# Replace the placeholders with your real commands.

.PHONY: verify test lint help

help: ## list targets
	@grep -E '^[a-zA-Z_-]+:.*## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "}; {printf "%-10s %s\\n", $$1, $$2}'

verify: lint test ## run all gates (must pass before a PR)
	@echo "verify: all gates passed"

test: ## run tests (placeholder: e.g. go test ./... | npm test | ./mvnw test)
	@echo "WARN: no test command wired yet. Edit the Makefile (target: test)."

lint: ## run linters (placeholder: e.g. golangci-lint run | npm run lint)
	@echo "WARN: no lint command wired yet. Edit the Makefile (target: lint)."
