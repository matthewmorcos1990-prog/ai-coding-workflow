#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/bootstrap-fury-labels.sh [owner/repo]
# If repo not provided, uses current gh repo context.

REPO="${1:-}"

run_gh() {
  if [[ -n "$REPO" ]]; then
    gh "$@" --repo "$REPO"
  else
    gh "$@"
  fi
}

labels=(
  "type:epic|1f6feb|Fury EPIC issue"
  "type:task|1f6feb|Fury TASK issue"
  "type:investigation|1f6feb|Fury investigation issue"
  "security-sensitive|d73a49|Security-sensitive scope"
  "draft|8b949e|Draft decomposition item"
  "qa:pass|2ea043|QA pass"
  "qa:pass-with-nits|fbca04|QA pass with nits"
  "qa:fail|cf222e|QA fail"
)

for entry in "${labels[@]}"; do
  IFS='|' read -r name color desc <<< "$entry"
  if run_gh label create "$name" --color "$color" --description "$desc" >/dev/null 2>&1; then
    echo "created: $name"
  else
    run_gh label edit "$name" --color "$color" --description "$desc" >/dev/null
    echo "updated: $name"
  fi
done

echo "Fury labels ready."
