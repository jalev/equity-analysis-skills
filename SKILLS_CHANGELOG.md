# Skills Changelog

All skill changes that modify `.md` command files are recorded here. Each entry must include an author benchmark and an independently-produced reviewer benchmark before the change is merged. See `_benchmarks/README.md` for the benchmark process.

Entries are newest-first.

---

<!--
## YYYY-MM-DD — <skill-name>

| Field | Value |
|---|---|
| PR | #N |
| Author | @handle |
| Skills changed | `skill-name.md` |
| Author benchmark | [`_benchmarks/_contributions/YYYY-MM-DD-<skill>/author.md`](_benchmarks/_contributions/YYYY-MM-DD-<skill>/author.md) |
| Reviewer benchmark | [`_benchmarks/_contributions/YYYY-MM-DD-<skill>/reviewer.md`](_benchmarks/_contributions/YYYY-MM-DD-<skill>/reviewer.md) |
| Reviewer sign-off | @handle — validated on [TICKER] — YYYY-MM-DD |

### What changed
One or two sentences describing the change.

### Why
What output failure or gap motivated the change. Reference the benchmark evidence.
-->

## 2026-03-31 — Initial release

| Field | Value |
|---|---|
| PR | — |
| Author | @kalamajakapital |
| Skills added | all 11 skills migrated from private research repo |
| Author benchmark | [`_benchmarks/CLAUDE.md`](_benchmarks/CLAUDE.md), [`_benchmarks/CODEX.md`](_benchmarks/CODEX.md) |
| Reviewer benchmark | cross-model: each model reviewed the other's work |
| Reviewer sign-off | Claude reviewed Codex (ONTO pack); Codex reviewed Claude (WISE.L pack) — 2026-03-30 |

### What changed
Initial public release. Skills and analytical rules extracted from a private research repo and published as a standalone submodule-ready repository.

### Why
Benchmarks across two models (Claude Sonnet 4.6 and GPT-5 Codex) and two tickers (ONTO, WISE.L) established a quality baseline. The analytical standard in `CLAUDE.md` was iterated three times during Codex benchmarking before stabilising at the version included here. See `_benchmarks/CODEX.md` for the full iteration history.
