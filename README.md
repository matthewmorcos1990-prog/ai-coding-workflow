# Isolated-agent AI coding workflow

AI coding workflow using Codex CLI + GitHub issues with isolated worktrees.

## Core principles
- Isolated agent responsibilities (Dev / QA / Merge / Investigate)
- Deterministic issue-driven workflow
- Clear, explicit acceptance criteria and evidence
- Minimal context bleed between tasks

## Commands
This workflow exposes three commands:
- `prd` — convert a vague idea into a decision-complete EPIC/PRD
- `impl` — orchestrate Dev → QA → Merge for one task issue
- `investigate` — run red-team investigation for one issue in sandbox mode

## Quickstart
1. Install prerequisites (`git`, `gh`, `codex`, `zsh`)
2. Install/link skills:
   ```bash
   ./scripts/install-skills.sh
   ```
3. Validate setup:
   ```bash
   ./scripts/doctor.sh
   ```
4. Source zsh commands in `~/.zshrc`:
   ```bash
   source /path/to/ai-coding-workflow/zsh/ai-coding-workflow.zsh
   ```

## Model + safety defaults
- Command model allowlist:
  - `gpt-5.3-codex`
  - `gpt-5.1-codex-max`
- Dangerous bypass mode is not used by default.
- `impl` and `investigate` run in sandboxed workspace-write mode.

## Usage
### PRD
```bash
prd "Draft an EPIC for: add X, remove Y, and keep Z unchanged"
```

### Implementation orchestrator
```bash
impl 123 "Keep it minimal; prove it with E2E"
```

### Red-team investigation
```bash
investigate 456 "Focus on auth boundary and RLS bypass attempts"
```

## Utility scripts
- `scripts/install-skills.sh`
- `scripts/doctor.sh`
- `scripts/bootstrap-fury-labels.sh`

## Security
This repo intentionally does **not** include secrets.
- do not commit `.env*`
- do not hardcode tokens in prompts

## License
MIT (see `LICENSE`).
