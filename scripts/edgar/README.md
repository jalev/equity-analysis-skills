# EDGAR Filings CLI

Small `click`-based wrapper around [`jadchaar/sec-edgar-downloader`](https://github.com/jadchaar/sec-edgar-downloader) for saving SEC filings into this repo's research tree.

## Install

From the repo root:

```bash
uv venv .venv
uv pip install --python .venv/bin/python -e scripts/edgar
```

Or use the repo helper:

```bash
make develop
```

`make develop` creates `.venv`, installs the local editable package with pinned dependencies, and opens a subshell with the virtual environment activated.

## Environment

The SEC requires an email address in the user agent.

The CLI first uses `SEC_EDGAR_EMAIL` and `SEC_EDGAR_COMPANY_NAME` from the current shell environment.
If they are not set there, it also loads the repo-root `.env` file when present.
If `SEC_EDGAR_EMAIL` is still missing after that, the CLI fails immediately.

```bash
export SEC_EDGAR_EMAIL="you@example.com"
export SEC_EDGAR_COMPANY_NAME="my-research"
```

Both are required. The CLI fails immediately if either is missing.

Example repo config:

```bash
cp .env-example .env
```

## Usage

By default, the CLI downloads the latest requested filing for the ticker and writes a plain-text `.txt` file to `research/data/<TICKER>/filings/`.
If `research/data/<TICKER>/filings/` does not exist yet, the CLI creates it automatically.
This default is intentional: `txt` is the most token-efficient format that remains readable for model-driven analysis.

```bash
.venv/bin/edgar-filings --ticker AAPL
.venv/bin/edgar-filings --ticker AAPL --filing 10-K --filing 10-Q
.venv/bin/edgar-filings --ticker AAPL --output-format txt
.venv/bin/edgar-filings --ticker AAPL --output-format html
.venv/bin/edgar-filings --ticker AAPL --output-format raw
```

If `--range-start` is provided, the CLI downloads all matching filings in the requested date range. `--range-end` defaults to today.

```bash
.venv/bin/edgar-filings --ticker AAPL --filing 10-Q --range-start 2025-01-01
.venv/bin/edgar-filings --ticker AAPL --filing 10-K --range-start 2024-01-01 --range-end 2025-12-31
```

## Output

Files are written under:

```text
research/data/<TICKER>/filings/<FISCAL_YEAR_LABEL>_Q<QUARTER>_<FORM>.<ext>
```

Examples:

```text
research/data/AAPL/filings/2025_Q4_10-K.txt
research/data/AAPL/filings/2025_Q4_10-K.html
research/data/AAPL/filings/2025_Q4_10-K.raw.txt
```

Supported output formats:

```text
txt  -> stripped plain text derived from the filing HTML; default because it is the most token-efficient readable format
html -> SEC primary filing document
raw  -> raw SEC full submission
```

The quarter label is inferred from the sequence of 10-K and 10-Q filings in the SEC submissions feed. For annual reports filed in January through March, the fiscal year label is normalized to the prior calendar year so the `Q1` to `Q4` sequence stays consistent with the existing repo convention.
