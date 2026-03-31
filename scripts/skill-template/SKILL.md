---
name: equity-analyst
description: Filing-based equity research workflows for process, business overview, industry scan, financial deep dive, moat analysis, management review, valuation check, bear case, earnings update, and decision journal. Use when the user asks for one of those analyses or explicitly invokes $equity-analyst.
---

# Equity Analyst

Use `references/AGENTS.md` as the base instruction set for this skill. Treat those instructions as authoritative for source discipline, data recency, and output standards.

Use the workflow files under `references/workflows/` as the source of truth for workflow-specific structure.

## Workflow Selection

- For business overview, read `references/workflows/business-overview.md`
- For edgar filings, read `references/workflows/edgar-filings.md`
- For industry scan, read `references/workflows/industry-scan.md`
- For financial deep dive, read `references/workflows/financial-deep-dive.md`
- For moat analysis, read `references/workflows/moat-analysis.md`
- For management review, read `references/workflows/management-review.md`
- For valuation check, read `references/workflows/valuation-check.md`
- For bear case, read `references/workflows/bear-case.md`
- For process, read `references/workflows/process.md`
- For earnings update, read `references/workflows/earnings-update.md`
- For decision journal, read `references/workflows/decision-journal.md`

When invoked, identify the requested workflow, load the matching file from `references/workflows/`, and execute it while keeping the rules from `references/AGENTS.md` intact.
