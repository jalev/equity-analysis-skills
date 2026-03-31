---
description: Download SEC EDGAR 10-K and 10-Q filings into the repo research tree using the local edgar-filings CLI.
---

Download SEC EDGAR filings into the repo using the local `edgar-filings` CLI under `scripts/edgar/`.

## Requirements

1. Use `SEC_EDGAR_EMAIL` from the environment for SEC access.
2. Default to `--output-format txt` because it is the most token-efficient readable format.
3. Save outputs under `research/data/<TICKER>/filings/`.
4. If the ticker path does not exist, create it.
5. When the user does not specify a filing type, default to `10-K`.
6. When the user does not specify a date range, default to the latest requested filing.

## Invocation Pattern

Use the installed CLI:

```bash
.venv/bin/edgar-filings --ticker <TICKER>
```

Examples:

```bash
.venv/bin/edgar-filings --ticker AAPL
.venv/bin/edgar-filings --ticker AAPL --filing 10-K --filing 10-Q
.venv/bin/edgar-filings --ticker AAPL --range-start 2021-01-01 --range-end 2026-03-28
.venv/bin/edgar-filings --ticker AAPL --output-format html
```

## Response Expectations

- State which ticker, filing type(s), date range, and output format were used.
- Report the files written under `research/data/<TICKER>/filings/`.
- If a live SEC request fails, say so clearly and include the command that was attempted.

> **After a successful fetch**, prepend an entry to `research/results/<TICKER>/CHANGELOG.md` following the format and self-reporting rules in AGENTS.md. Set Workflow to `edgar-filings`, list the files written under "Memos written", and set Primary source to "SEC EDGAR".
