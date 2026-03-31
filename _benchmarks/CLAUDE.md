# Claude Benchmark — Equity Research Quality

## Overview

| Field | Value |
|---|---|
| Subject model | Claude Sonnet 4.6 (`claude-sonnet-4-6`), operating as Claude Code |
| Reviewer | GPT-5 Codex, operating as Codex |
| Work reviewed | Wise plc (ticker: `WISE.L`) research pack |
| Comparator | ONTO Innovation (ticker: `ONTO`) pack reviewed in [CODEX.md](./CODEX.md) |
| Runs graded | 1 |

---

## What Was Reviewed

The WISE.L pack under `research/results/WISE.L/memos/` contains eight memo files:

| Memo | File | Status |
|---|---|---|
| Business Overview | `business-overview.md` | populated |
| Financial Deep Dive | `financial-deep-dive.md` | populated |
| Industry Scan | `industry-scan.md` | populated |
| Moat Analysis | `moat-analysis.md` | populated |
| Management Review | `management-review.md` | populated |
| Valuation Check | `valuation-check.md` | populated |
| Bear Case | `bear-case.md` | populated |
| Earnings Updates | `earnings-updates.md` | empty placeholder |

The overall grade below is based on the seven populated analytical memos. The empty `earnings-updates.md` is treated as a completeness issue and discussed separately rather than folded mechanically into every memo grade.

---

## Grades

| Memo | Grade | Primary Strength | Primary Weakness |
|---|---|---|---|
| Business Overview | A- | Excellent business-model and revenue-mix synthesis | Uses page-style references and occasional light extrapolation from quarterly appendices |
| Financial Deep Dive | A | Strongest memo in the pack; real accounting and unit-economics work | Some normalisation estimates could be tied even more tightly to source tables |
| Industry Scan | A- | Clear structural map of market, cost flywheel, and regulation | No named competitor comparison possible from documents, so the memo stays structural rather than comparative |
| Moat Analysis | A- | Best proof-of-moat memo in either pack; cost flywheel is quantified | Some network-effect discussion is more conceptual than evidenced |
| Management Review | B+ | Balanced on guidance credibility and governance tradeoffs | One or two inferences lean beyond strict in-project source discipline |
| Valuation Check | B+ | Complete scenario and reverse-DCF framework despite price gap | Explicitly introduces unsourced peer context, which violates strict source discipline |
| Bear Case | A- | Adversarial, quantified, and falsifiable | A few competitor references go beyond the uploaded documents |
| Earnings Updates | N/A | — | File is empty |
| **Overall** | **A-** | Analytical quality is consistently high across core memos | Not fully clean on source discipline; one memo file is empty |

---

## Qualitative Assessment

### What Claude did well

The WISE.L pack consistently does the thing that the early ONTO pack often failed to do: it converts filing facts into investment decisions. The best memos do not stop at "what happened"; they ask what the numbers imply about business quality, durability, and valuation. The financial deep dive is the clearest example. It identifies the rate-dependent gap between reported and underlying PBT, explains why FY25 FCF conversion is temporarily elevated, treats the buyback as an SBC-offset rather than a capital return, and recognises that Wise's balance sheet is economically distorted by safeguarded customer funds.

The moat memo is especially strong. It proves the cost advantage rather than merely asserting it: cost of sales grew only 5% versus 15% revenue growth, the take rate fell roughly 29% over four years, and underlying gross profit margin still expanded 2 points to 75%. That is exactly the kind of economic manifestation a committee memo should surface. The bear case is also properly adversarial. It names a single thesis killer up front, computes a break-even take rate of 0.419%, sizes multiple EPS impacts, and lists seven observable triggers that would prove the bear right.

The pack is also structurally mature. It handles data gaps honestly, flags where competitor evidence is absent, and still produces useful outputs instead of punting. On analytical usefulness to an investor, this pack is materially better than the original ONTO run and still better than the final ONTO rerun.

### Where Claude fell short

The biggest weakness is not analytical depth. It is source discipline. Several memos step outside the uploaded documents even while flagging that they are doing so. The valuation memo introduces unsourced peer context for Remitly, Adyen, Western Union, and sector EV/revenue bands. The bear case references Revolut, Monzo, Apple Wallet, and Meta as competitive threats even though the industry memo explicitly says no competitors are named in the available filings. The management memo mentions founder control "per IPO documentation" even though that document is not in the project. These are analytically reasonable points, but under the current research rules they are still violations.

The second weakness is completeness. `earnings-updates.md` exists but is empty. That is not a problem with the quality of the populated work, but it is a process miss for a pack that otherwise looks publication-ready.

There are also a few places where the work is still a little too elegant relative to the evidence. The moat memo's network-effects discussion is thoughtful but more inferential than directly supported. The financial deep dive's FY26 margin-bridge math is useful, but parts of it depend on annualising Q1 and projecting management intent rather than staying strictly on historically disclosed numbers. These are small deductions, not structural failures.

### Bottom line

This is an `A-` pack because the analysis is genuinely investment-grade. It is numerate, adversarial when needed, and mostly excellent at translating disclosures into implications. It misses an `A` or `A+` for two reasons:

1. It is not fully clean on source discipline under the current rules.
2. One memo file is empty, which breaks the sense of full-pack completeness.

If the source discipline were tightened and the empty earnings-update placeholder either populated or removed from the deliverable set, this would be very close to an `A` benchmark for filing-based work.

---

## Comparison To ONTO

Relative to the final ONTO rerun graded in [CODEX.md](./CODEX.md), the WISE.L pack is still stronger overall.

- WISE.L is more decisive. The best example is the bear case opening: it leads with a clear thesis and then earns it numerically.
- WISE.L is better at turning one number into a whole argument. The take-rate break-even math and the cost-flywheel proof are both committee-grade insights.
- ONTO caught up materially on valuation, accounting flags, and downside framing, but still reads more like a corrected analytical pack. WISE.L reads like a naturally analytical pack from the start.

The gap is no longer huge after the latest ONTO work, but WISE.L remains the better benchmark.

---

## Recommendation

The WISE.L pack should remain the comparator benchmark for this repo, but it should be cleaned up if it is going to serve as the formal gold standard under the current rules.

The path from `A-` to `A` is straightforward:
- Remove unsourced peer and competitor references from valuation and bear case, or replace them with in-project documents.
- Tighten the management memo to avoid references to non-uploaded IPO documentation.
- Populate `earnings-updates.md` or explicitly exclude it from the pack.

Those are cleanup tasks, not analytical rewrites.
