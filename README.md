# equity-analysis-skills

Filing-based equity research skills for Claude Code and OpenAI Codex. Covers the full research workflow: business overview, industry scan, financial deep dive, moat analysis, management review, valuation check, bear case, earnings update, and decision journal.

Skills are driven by `CLAUDE.md` — a set of analytical standards that enforce investment-grade output: sourced claims only, minimum quant work per section, adversarial bear cases, and an anti-summary check before any memo is finalised.

---

## Contents

```
equity-analysis-skills/
├── bear-case.md              ┐
├── business-overview.md      │
├── decision-journal.md       │
├── earnings-update.md        │  slash commands — loaded by Claude Code
├── edgar-filings.md          │  or bundled into a Codex skill
├── financial-deep-dive.md    │
├── industry-scan.md          │
├── management-review.md      │
├── moat-analysis.md          │
├── process.md                │
├── valuation-check.md        ┘
│
├── CLAUDE.md                    shared analytical rules (importable downstream)
├── SKILLS_CHANGELOG.md          per-skill change history with benchmark evidence
│
├── _benchmarks/
│   ├── README.md                how benchmarks work
│   ├── template.md              copy this to start a new benchmark
│   ├── CLAUDE.md                Claude benchmark (WISE.L pack, graded by Codex)
│   ├── CODEX.md                 Codex benchmark (ONTO pack, graded by Claude)
│   └── _contributions/          per-PR author + reviewer benchmark pairs
│
├── scripts/
│   ├── install-codex-skill.sh   installs equity-analyst Codex skill
│   ├── install-git-hooks.sh     configures repo git hooks
│   ├── edgar/                   EDGAR filing downloader (Python package)
│   └── skill-template/
│       ├── SKILL.md             Codex skill manifest
│       └── AGENTS.md            Codex base instruction set
│
├── .githooks/                   auto-refresh hooks (post-checkout, post-merge)
└── Makefile
```

---

## Using as a submodule (recommended)

The intended pattern: your research repo is private, skills are public. Mount this repo as a submodule at `.claude/commands/` so Claude Code picks up the skills automatically with no install step.

### Initial setup

```bash
# From your research repo root
git submodule add git@github.com:kalamajakapital/equity-analysis-skills.git .claude/commands
git submodule update --init
git add .gitmodules .claude/commands
git commit -m "add equity-analysis-skills as submodule"
```

### Wire up CLAUDE.md

Your research repo's `CLAUDE.md` should import the shared rules and add any project-specific additions:

```markdown
@.claude/commands/CLAUDE.md

<!-- project-specific additions below, if any -->
```

Claude Code merges both at load time. Upstream rule changes flow in automatically on the next submodule update.

### Keeping skills up to date

```bash
git submodule update --remote .claude/commands
git add .claude/commands
git commit -m "bump skills to latest"
```

### Auto-update on pull

Add to your research repo's `.githooks/post-merge`:

```sh
#!/bin/sh
git submodule update --remote --merge .claude/commands 2>/dev/null || true
```

Then register the hooks path once:

```bash
git config core.hooksPath .githooks
```

### Install the edgar EDGAR downloader

```bash
uv pip install -e .claude/commands/scripts/edgar
```

Or via Make if your research repo has a `develop` target pointing at the submodule path.

---

## Using standalone

Clone directly and install skills to your user-level Claude commands directory:

```bash
git clone git@github.com:kalamajakapital/equity-analysis-skills.git
cd equity-analysis-skills
make install
```

`make install` symlinks each skill `.md` into `~/.claude/commands/` and installs the Codex skill. Skills are then available in every project you open in Claude Code.

---

## Available skills

| Skill | Command | Purpose |
|---|---|---|
| Process | `/process` | Full research workflow — runs all skills in sequence |
| Business Overview | `/business-overview` | Business model, revenue model, customers, segments |
| Industry Scan | `/industry-scan` | Market structure, growth drivers, competitors, value chain |
| Financial Deep Dive | `/financial-deep-dive` | Growth, margins, cash flow, capital allocation, accounting flags |
| Moat Analysis | `/moat-analysis` | Competitive advantages, moat sources, moat trajectory |
| Management Review | `/management-review` | Capital allocation, incentives, guidance credibility |
| Valuation Check | `/valuation-check` | Filing-based valuation, scenario analysis, reverse-DCF |
| Bear Case | `/bear-case` | Adversarial downside thesis with quantified triggers |
| Earnings Update | `/earnings-update` | Latest quarter vs guidance, KPI trends, historical results |
| Decision Journal | `/decision-journal` | Investment decision capture with thesis and reversal conditions |
| EDGAR Filings | `/edgar-filings` | Download 10-K and 10-Q filings via the edgar CLI |

---

## Contributing

All contributions that modify a skill file require:

1. A benchmark demonstrating the change improves output quality
2. An independent reviewer benchmark before the PR can merge
3. A `SKILLS_CHANGELOG.md` entry

The benchmark requirement is not optional. A skill change with no benchmark evidence cannot be reviewed and will not be merged.

We do not know what the process will look like in practice yet. We'll figure out the process once there's contributions that objectively improve the quality of the Analisys.

---

## Makefile targets

| Target | What it does |
|---|---|
| `make install` | Install skills to `~/.claude/commands/` and Codex skill to `~/.codex/skills/` |
| `make install-claude` | Install to `~/.claude/commands/` only |
| `make install-codex` | Install Codex skill only |
| `make hooks` | Register `.githooks/` as the git hooks directory |
| `make develop` | Create `.venv`, install edgar package, open activated shell |

---

## Analytical standard

Skills follow the rules in `CLAUDE.md`. Key requirements:

- Every factual claim must be sourced to a specific filing section — never line numbers, never training knowledge
- Five-year tables are the default when data is available
- Every financial deep dive must include an `Accounting Flags` section
- Moat claims require filing-based proof of economic manifestation
- Bear cases must be adversarial and falsifiable: one primary thesis, quantified downside, three observable triggers, a combined scenario
- Valuation must be attempted even when live price is unavailable — use filing-based anchors
- The anti-summary check (four questions) must pass before any memo is finalised

The benchmark files in `_benchmarks/` show what output quality looks like in practice against these rules.
