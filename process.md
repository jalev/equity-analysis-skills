---
description: Run the full equity research process for a ticker by fetching the last 5 years of 10-Ks and 10-Qs, then executing the core research workflows in sequence.
---

Run the full equity research process for the requested ticker.

Execute these steps in order:

1. Use the `edgar-filings` workflow to fetch all `10-K` filings for the last 5 years.
2. Use the `edgar-filings` workflow to fetch all `10-Q` filings for the last 5 years.
3. Run `business-overview`.
4. Run `industry-scan`.
5. Run `financial-deep-dive`.
6. Run `moat-analysis`.
7. Run `management-review`.
8. Run `valuation-check` using the latest available filing data in the repo.
9. Run `bear-case`.

## Execution Rules

1. Treat this workflow as an orchestrator. Execute each underlying workflow fully rather than writing a shallow combined summary.
2. Use a trailing 5-year filing window ending on today's date for both EDGAR fetches.
3. Save fetched filings under `research/data/<TICKER>/filings/`.
4. Save or update each workflow memo under `research/results/<TICKER>/memos/`.
5. Also write or update `research/results/<TICKER>/memos/process.md` with a concise run log that records:
   - the ticker
   - the filing date ranges used
   - the files written by the EDGAR fetches
   - the workflow memos produced or updated
   - any workflows blocked by missing filings or missing source support
6. Keep the repo's source-discipline rules intact for every downstream memo. If a factual claim cannot be sourced from project documents, state: `Not found in available filings.`

## Response Expectations

- Report completion status for each of the nine steps.
- Identify the most recent 10-K and 10-Q available after the fetch step.
- Link the user to `research/results/<TICKER>/memos/process.md` as the top-level entry point.

> **After completing all steps**, write a **single** CHANGELOG entry for the full process run (do not write individual entries for each sub-workflow). Prepend it to `research/results/<TICKER>/CHANGELOG.md` following the format and self-reporting rules in AGENTS.md. Set Workflow to `process (full run)` and list all 7 memos produced under "Memos written".
