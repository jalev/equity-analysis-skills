---
description: Capture an investment decision, thesis state, assumptions, and reversal conditions in a structured journal entry.
---

I want to record an investment decision. Ask me the following questions
one at a time, then compile the entry:

1. **Action**: Buy / Sell / Add / Trim / Hold (and size if applicable)
2. **Date**: When is this decision being made?
3. **Price**: Current share price at time of decision
4. **Thesis summary**: In 2-3 sentences, why am I taking this action?
5. **Key assumptions**: What 2-3 things must go right for this to work?
6. **What would change my mind**: Specific, measurable conditions that
   would cause me to reverse this decision
7. **Thesis status**: Is the original investment thesis intact, evolving,
   or broken?
8. **Confidence level**: High / Medium / Low - and why?

Format as a dated entry using this template:

## YYYY-MM-DD - [ACTION] @ $[PRICE]

**Thesis:** [summary]

**Key assumptions:**
- [assumption 1]
- [assumption 2]
- [assumption 3]

**I'm wrong if:** [conditions]

**Thesis status:** [Intact / Evolving / Broken]
**Confidence:** [High / Medium / Low] - [reason]

Write or append the entry under `research/results/<TICKER>/journal/decision-journal.md`.

> **After writing the journal entry**, prepend an entry to `research/results/<TICKER>/CHANGELOG.md` following the format and self-reporting rules in AGENTS.md. Set Workflow to `decision-journal` and summarise the action taken (e.g. "Recorded Buy decision @ $X.XX").
