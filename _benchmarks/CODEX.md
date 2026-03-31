# Codex Benchmark — Equity Research Quality

## Overview

| Field | Value |
|---|---|
| Subject model | GPT-5 Codex (OpenAI Codex harness) |
| Reviewer | Claude Sonnet 4.6 (`claude-sonnet-4-6`), operating as Claude Code |
| Work reviewed | ONTO Innovation (ticker: `ONTO`) full research pack — 7 memos |
| Comparator | WISE.L (Wise plc) full research pack — 8 memos, produced by the same Codex harness |
| Runs graded | 3 (all on 2026-03-30) |

---

## Run History

| Run | Date | CLAUDE.md version | Overall Grade |
|---|---|---|---|
| Run 1 | 2026-03-30 | Pre-analytical-standard (original) | C+ |
| Run 2 | 2026-03-30 | Analytical Standard added (first update) | B |
| Run 3 | 2026-03-30 | Management + Anti-Summary Q4 + "so what" added (second update) | B+ |

---

## What Was Reviewed

Codex ran the full equity research workflow on ONTO Innovation using SEC EDGAR filings (5× 10-K, multiple 10-Q). It produced the following memos under `research/results/ONTO/memos/`:

| Memo | File |
|---|---|
| Business Overview | `business-overview.md` |
| Financial Deep Dive | `financial-deep-dive.md` |
| Industry Scan | `industry-scan.md` |
| Moat Analysis | `moat-analysis.md` |
| Management Review | `management-review.md` |
| Valuation Check | `valuation-check.md` |
| Bear Case | `bear-case.md` |

The WISE.L pack (produced by the same Codex harness in an earlier run) was used as the quality comparator because it was judged by the reviewer to represent a materially higher standard of analytical output from the same model and harness.

---

## Grade Progression

| Memo | Run 1 | Run 2 | Run 3 |
|---|---|---|---|
| Business Overview | B+ | B+ | B+ |
| Financial Deep Dive | C+ | B+ | A- |
| Industry Scan | B | B | B |
| Moat Analysis | C | B- | B- |
| Management Review | B- | B | B |
| Bear Case | C- | B | B+ |
| Valuation Check | D | B+ | A- |
| **Overall** | **C+** | **B** | **B+** |

---

## Run 1 — C+ (pre-analytical-standard instructions)

### What Codex did well

The descriptive memos were genuinely competent. Business Overview and Industry Scan show that Codex read the filings carefully: five-year revenue and geographic tables were clean and correctly sourced, the China export-control story was told accurately, and the competitor matrix by tool category was useful. The Management Review was honest about the proxy gap rather than papering over it. Citation discipline and memo structure (narrative → quote → table → key observation) were followed consistently.

### Primary failure modes

**1. Assertions without arithmetic.** "FY2025 looks like a reset year rather than a broken model year" (Financial Deep Dive) was stated, not argued. The WISE.L bear case opened with "The take rate has no floor and is already destroying revenue" and then provided the break-even calculation. ONTO never reached that level.

**2. Current state described as forward trigger.** The bear case trigger "gross margin stays near FY2025's 49.7%" describes where margins are now, not a threshold that would confirm the bear thesis. All four listed triggers had this problem.

**3. Valuation abandoned instead of reframed.** The valuation memo correctly identified that live price was unavailable, then used that as a reason to produce no valuation work. The WISE.L valuation memo faced the identical constraint and built a complete multiples framework, a reverse DCF at five price levels, and three scenario price targets.

**4. No accounting flags section.** SBC at 20% of net income was described as "modest." Preliminary purchase accounting was cited and filed away. $256.4m in purchase commitments was never expressed as a percentage of COGS.

### Root cause

The instruction set in force governed source discipline and memo structure well but imposed no minimum analytical obligations. It told Codex how to format analysis but not what analysis to produce. This is an instruction gap, not a capability gap — the WISE.L pack, produced under the same instructions, demonstrates the model can do the analytical work when it chooses to.

### Instruction changes triggered

On 2026-03-30, CLAUDE.md was updated to add `## Analytical Standard`. Key additions:
- Minimum quant work per section (ratios, 5-year comparisons, sensitivity, tensions)
- Valuation: explicit fallback framework when live price is unavailable
- Accounting Flags: required section in every financial deep dive
- Moat: proof of economic manifestation required for every claimed dimension
- Unit Economics: proxy metrics required; "Not found" not a valid terminal answer
- Bear Case: triggers must be deviations from current state; quantified downside required; goodwill impairment sizing required
- Narrative Standard: directional claim must lead every key observation
- Anti-Summary Check: three gate questions before finalising

---

## Run 2 — B (first analytical-standard instructions)

### What improved

The four analytical memos that failed hardest in Run 1 all made meaningful jumps. The valuation memo went from D to B+: a complete multiples table at five price points, a reverse DCF showing implied 10-year FCF CAGR, and three scenario price ranges with specific dollar values. The bear case went from C- to B: all triggers now represent deviations from current state, a four-scenario goodwill impairment table was added, and purchase commitments were quantified at 50.7% of COGS. The financial deep dive added a full accounting flags section (six items), quarterly margin and revenue trend tables, and correctly identified SBC at 20.2% of net income.

### Remaining gaps after Run 2

- Financial deep dive: management's stated explanations for the margin decline were not tested against the full magnitude of the 250 bps gross margin / 580 bps operating margin drop. No residual quantification.
- Financial deep dive: no acquisition split — reported 2% revenue growth was not decomposed into standalone ONTO vs Semilab contribution.
- Valuation: the June 2025 market-cap anchor was cited but not converted to an implied share price, leaving the multiples table disconnected from any real-world reference point.
- Valuation: combined pro forma net income decline (-27.6%) was in the filing but not used.
- Bear case: only one sized downside scenario; no combined scenario stacking margin + China + inventory charges.
- Moat and management: not updated despite new instructions that applied directly to both.

### Instruction changes triggered

On 2026-03-30, CLAUDE.md received three further additions:
- "After every key fact, ask: *so what for value, risk, or quality?*" added to memo structure
- Management subsection added: capital allocation during margin deterioration must be treated as a live analytical question, not a neutral fact
- Anti-Summary Check extended to four questions, adding: "What is the single most damaging number in the filing — and did I use it?"

---

## Run 3 — B+ (second analytical-standard instructions)

### What improved

**Financial Deep Dive (C+ → B+ → A-):** Added an acquisition split table isolating standalone ONTO revenue growth at 0.9% and combined pro forma growth at 0.9%. Added a margin bridge table quantifying the gap between management's stated drag ($25.9m) and the actual operating income shortfall ($58.3m), surfacing a minimum $32.4m unexplained residual. Key observation: "too large to wave away as temporary without stronger proof." Added working-capital timing as a named accounting flag.

**Valuation Check (D → B+ → A-):** Derived the implied June 2025 share price ($96.92) from the market-cap anchor — the multiples table now has a real filing-based starting point rather than only hypothetical prices. Added a dedicated "Acquisition-Adjusted Growth Test" section showing combined pro forma net income fell 27.6%, implying Semilab generated -$4.4m of earnings on a full-year basis. The closing key observation named the investment risk directly: "the stock looks more like a full valuation on hope than a clear bargain on numbers."

**Bear Case (C- → B → B+):** The "Assumptions At Risk" section now has a quantified table showing four measures of underlying weakness. The margin downside is a dedicated section with a complete calculation shown in table form. Balance-sheet risk table now shows FY2024 vs FY2025 purchase commitments, giving the improvement context.

### Remaining gaps after Run 3

- **Bear case:** still only one sized downside scenario. No combined scenario stacking flat margins + continued China constraint + repeat inventory charges. This is the gap between B+ and A-.
- **Moat:** peer return comparison still absent. Customer leverage tension is correctly identified but not quantified (e.g. what revenue is at risk if Customer A reduces spend by 20%?). No change from Run 2.
- **Management:** not updated despite the new timing instruction added between Run 2 and Run 3. The capital allocation tension is already well-handled from Run 2, but the new "so what for value, risk, or quality?" instruction was not explicitly applied.
- **Financial deep dive:** normalized FCF estimate (haircutting the working-capital benefit) not attempted.

### Overall trajectory

Codex responds reliably to specific, testable rules and less reliably to general exhortations. Every instruction that named a concrete deliverable (margin bridge, acquisition split, implied price derivation, impairment table) produced the deliverable. Every instruction that described a standard without naming a specific output (moat peer comparison, combined bear scenario) was not acted on. The implication for future instruction design: name the output, not just the obligation.

---

## Benchmark Rerun Recommendation

A fourth run would test whether the remaining gaps (combined bear scenario, moat peer comparison, normalized FCF) can be closed with more specific output-naming instructions, or whether they represent a ceiling for this model-and-harness combination on filing-only data. The path to an A pack from the current B+ is narrow: three memos (bear case, moat, financial deep dive) each need one additional computation that was available in the filings but not used.
