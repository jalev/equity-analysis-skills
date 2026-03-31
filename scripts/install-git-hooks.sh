#!/bin/sh

set -eu

repo_root=$(git rev-parse --show-toplevel)
git config core.hooksPath "$repo_root/.githooks"

echo "Configured git hooks: $repo_root/.githooks"
echo "Next checkout or merge will refresh the local Codex skill installation."
