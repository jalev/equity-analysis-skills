# Benchmarks

This directory holds evidence of skill quality: both the baseline benchmarks that established the initial standard, and per-contribution benchmark pairs that validate each skill change before it merges.

---

## Baseline benchmarks

| File | Subject model | Reviewer | Pack |
|---|---|---|---|
| [`CLAUDE.md`](./CLAUDE.md) | Claude Sonnet 4.6 (Claude Code) | GPT-5 Codex | WISE.L — 8 memos |
| [`CODEX.md`](./CODEX.md) | GPT-5 Codex | Claude Sonnet 4.6 (Claude Code) | ONTO — 7 memos, 3 runs |

These are the reference benchmarks. New contributions should produce output that meets or exceeds the grades documented here.

---

## Contribution benchmarks

Per-PR benchmark pairs live under `_contributions/`. Each subdirectory corresponds to one PR and contains two files:

```
_contributions/
  YYYY-MM-DD-<skill>/
    author.md      ← filed by the PR author before opening the PR
    reviewer.md    ← filed by the maintainer independently, before approving
```

The reviewer must run the skill independently — without reading the author's output first. If the reviewer's grade materially differs from the author's, the discrepancy must be explained in the PR before merging.

---

## How to run a benchmark

1. Choose a company with at least one available 10-K or 10-Q
2. Download the filing using `/edgar-filings` or manually
3. Run the relevant skill to completion
4. Grade the output against the analytical standard in `CLAUDE.md` using the criteria in `template.md`
5. Record the result in the benchmark file

A benchmark is only valid if it is reproducible: another person should be able to follow your setup and produce a comparable result.

---

## Grading scale

| Grade | Meaning |
|---|---|
| A+, A, A- | Investment-grade. Analytical, sourced, adversarial where required. |
| B+, B, B- | Competent. Meets most requirements but has identified gaps. |
| C+, C, C- | Descriptive but not analytical. Present value to an investor is limited. |
| D | Filing summary only. Fails the anti-summary check. |
| F | Unsourced claims, fabricated numbers, or hallucinated filings. |

Grade at the memo level, then give an overall pack grade. Document primary strengths and primary weaknesses for each memo.
