# CLAUDE.md — Project Instructions

> Claude Code reads this file automatically. Do not delete it.

## Project

Waqar & Brothers — Daily Account Book (digital replacement for a physical paper register)
A local-only accounting app for a Tapal (tea) wholesale agency in Pakistan.

## Tech Stack (LOCKED — do not change)

- Backend: Python 3.11 + Flask
- Database: SQLite (plain, no encryption in Phase 1)
- Frontend: HTML + CSS + Vanilla JavaScript (no React, no Vue, no Tailwind)
- Runs on: Windows 11 laptop, accessed via Chrome/Edge at http://localhost:8000

## Project Location

```
C:\WaqarBrothers\
├── app\              # Flask app (app.py, templates/, static/)
├── data\             # accounts.db (SQLite database)
├── logs\             # app.log (Flask output)
├── install.bat       # One-time setup script
├── start.bat         # Starts the app
└── README.txt        # User instructions (plain English)
```

## Current Phase

Phase 1 — MVP Core Daily Entry (login + add recovery + add expense + daily totals)

## Key Business Rules

1. This is a tea wholesale agency. Salesmen go out daily and collect payments (**recovery**) from shopkeepers.
2. All amounts in **PKR** with **lakh/crore** comma formatting (e.g., PKR 19,52,413).
3. Financial year: **July 1 to June 30**.
4. **Bank Slip** entries are NOT expenses — they are cash-to-bank transfers.
5. **Owner Drawings** (Waqar, Waqas, Home) are NOT business expenses — they are personal withdrawals.
6. **Profit/Loss = Total Recovery − Business Expenses ONLY.** Exclude drawings, bank transfers, charity.
7. Same salesman can have multiple entries per day.
8. Closing balance of one day = opening balance of the next day (walk back to most recent day with entries — skip gap days).
9. **Soft delete only.** Never hard-delete any record. Set is_deleted = 1.

## Coding Rules

- Give full working code. No placeholders. No "TODO" comments.
- All SQL must use **parameterized queries** (never string concatenation).
- **Never store passwords as plain text.** Use werkzeug.security or hashlib.
- All amounts stored as **INTEGER** in the database (no decimals).
- Flask SECRET_KEY must be generated in install.bat and stored in config.py — never hardcoded.
- The [Del] button must be inside a `<form method="POST">` — never an `<a href>` link.
- Build only the **current phase**. Do not add features from later phases.

## Phase Overview

| Phase | Name                    | Status      |
|-------|-------------------------|-------------|
| 1     | MVP — Core Daily Entry  | 🔨 Building |
| 2     | Full Register Features  | ⏳ Waiting   |
| 3     | Backup                  | ⏳ Waiting   |
| 4     | Phone Access & UI Polish| ⏳ Waiting   |

## Full PRD

For complete feature specs, database schema, UI layouts, validation rules, and step-by-step build instructions, see:
**Waqar_Brothers_Digital_Account_Book_PRD.md**
