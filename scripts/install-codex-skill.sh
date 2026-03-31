#!/bin/sh

set -eu

repo_root=$(git rev-parse --show-toplevel)
skill_name="equity-analyst"
skills_dir="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
installed_skill_path="$skills_dir/$skill_name"

mkdir -p "$skills_dir"

export REPO_ROOT="$repo_root"
export SKILL_NAME="$skill_name"
export INSTALLED_SKILL_PATH="$installed_skill_path"
python3 - <<'PY'
import os
import shutil
from pathlib import Path

repo_root = Path(os.environ["REPO_ROOT"])
skill_name = os.environ["SKILL_NAME"]
installed_skill_path = Path(os.environ["INSTALLED_SKILL_PATH"])

source_commands_dir = repo_root
source_agents_path = repo_root / "scripts" / "skill-template" / "AGENTS.md"
source_skill_template = repo_root / "scripts" / "skill-template" / "SKILL.md"

workflow_files = [
    "bear-case.md",
    "business-overview.md",
    "edgar-filings.md",
    "decision-journal.md",
    "earnings-update.md",
    "financial-deep-dive.md",
    "industry-scan.md",
    "management-review.md",
    "moat-analysis.md",
    "process.md",
    "valuation-check.md",
]

if not source_agents_path.is_file():
    raise SystemExit(f"Missing AGENTS.md: {source_agents_path}")

if not source_skill_template.is_file():
    raise SystemExit(f"Missing skill template: {source_skill_template}")

for filename in workflow_files:
    if not (source_commands_dir / filename).is_file():
        raise SystemExit(f"Missing workflow source: {source_commands_dir / filename}")

if installed_skill_path.is_symlink() or installed_skill_path.is_file():
    installed_skill_path.unlink()
elif installed_skill_path.is_dir():
    shutil.rmtree(installed_skill_path)

references_dir = installed_skill_path / "references"
workflows_dir = references_dir / "workflows"
workflows_dir.mkdir(parents=True, exist_ok=True)

shutil.copy2(source_agents_path, references_dir / "AGENTS.md")
for filename in workflow_files:
    shutil.copy2(source_commands_dir / filename, workflows_dir / filename)

shutil.copy2(source_skill_template, installed_skill_path / "SKILL.md")
PY

echo "Installed Codex skill '$skill_name' in $installed_skill_path"
