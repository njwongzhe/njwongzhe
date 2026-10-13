---
name: comment-rewriter
description: >-
  Use this skill whenever rewriting, formatting, or updating code comments
  to enforce one-sentence-per-line integrity, proper terminal punctuation,
  and Title Case for headings.
---

# Comment Rewriting Rules

Follow these guidelines when writing, rewriting, or formatting code comments:

## 1. One Sentence Per Line (Strict Line Integrity)
- **Do not wrap or break a single sentence across multiple lines.** Keep every single sentence on its own line.
- **Do not place multiple sentences on the same line.** If there are two or more sentences, put each sentence on its own separate comment line.
- **Handle long sentences:** If a sentence is excessively long, do not arbitrarily wrap it. Instead:
  - **Condense it** into a single concise sentence on one line, OR
  - **Split it into two complete sentences on separate lines** (each with its own comment prefix).

## 2. Punctuation and Capitalization
- **Sentence-Style Comments:**
  - If a comment is written as a full sentence, **always end it with a period (`.`)**.
- **Title/Heading-Style Comments:**
  - If a comment is formatted as a title or section heading:
    - **Do NOT** add a period at the end.
    - **Apply Title Case:** Capitalize the first letter of each major word.

---

## Examples

### Rule 1: One Sentence Per Line
```sql
-- INCORRECT (One sentence split across lines):
-- Retrieve all active users who registered
-- within the last thirty days.

-- INCORRECT (Multiple sentences crammed onto the same line):
-- Retrieve all active users registered in the last 30 days. Filter out deactivated accounts.

-- CORRECT (Single sentence on a single line):
-- Retrieve all active users registered within the last 30 days.

-- CORRECT (Two sentences split across separate lines):
-- Retrieve all active users registered in the last 30 days.
-- Filter out deactivated accounts.
```

### Rule 2: Sentence Style vs. Title Style
```sql
-- Sentence Style: Always end with a period.
-- Fetch account details and calculate total monthly revenue.

-- Title Style: Title Case, no period at the end.
-- Database Configuration and Connection Pool Setup
```
