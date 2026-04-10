# 💼 Waqar & Brothers — Daily Account Book
# Digital Version · Product Requirements Document (PRD)

**Last Updated:** April 2026
**Version:** 3.1 (Final — reviewed and fixed)
**Business:** Waqar & Brothers — Tapal Tea Wholesaler

---

## 📋 Table of Contents

1. [Project Summary](#project-summary)
2. [Business Overview](#business-overview)
3. [Physical Register Structure](#physical-register-structure)
4. [Tech Stack](#tech-stack)
5. [Development Phases](#development-phases)
6. [Phase 1 — Detailed Spec](#phase-1--detailed-spec)
7. [Database Schema](#database-schema)
8. [User Flow](#user-flow)
9. [UI Requirements](#ui-requirements)
10. [Phase 2 — Detailed Spec](#phase-2--detailed-spec)
11. [Phase 3 — Backup](#phase-3--backup)
12. [Phase 4 — Phone Access](#phase-4--phone-access)
13. [Business Rules](#business-rules)
14. [Validation Rules](#validation-rules)
15. [Currency Formatting](#currency-formatting)
16. [Rules for AI Developer](#rules-for-ai-developer)
17. [Start Task](#start-task)

---

## Project Summary

| Detail            | Value                                                  |
| ----------------- | ------------------------------------------------------ |
| Business          | Waqar & Brothers — Tapal Tea Wholesaler                |
| App Type          | Daily Account Book (replaces physical paper register)  |
| Platform          | Windows 11 laptop (local only)                         |
| Users             | 1 (owner only)                                         |
| Backend           | Python 3.11 + Flask                                    |
| Database          | SQLite (plain, no encryption in Phase 1)               |
| Frontend          | HTML + CSS (basic) + Vanilla JavaScript                |
| Browser           | Chrome or Edge (already on Windows 11)                 |
| Phone Access      | Phase 4 only (not in Phase 1, 2, or 3)                 |
| Cloud / Internet  | Not required. App runs fully offline.                  |
| Build Strategy    | One phase at a time. Confirm each phase before next.   |

---

## Business Overview

Waqar & Brothers is a **Tapal (tea) wholesale agency**. The daily workflow is:

1. Salesmen go out daily — Khalid, Shahid Ali, Shakeel, Amanullah, Dhani Bux, etc.
2. Each salesman visits shops and collects payment (called **recovery**) from shopkeepers who owe money for tea stock already delivered.
3. At end of day, each salesman returns and reports the total amount they recovered.
4. The owner writes the figure in the **Daily Account Book** (the paper register this app replaces).
5. The owner also writes down the day's **expenses** (food, salary, petrol, bank deposits, etc.).
6. At end of day, the owner counts physical cash by note denomination and checks it matches the book total.

**Key terms used throughout this document:**

| Term             | Meaning                                                                 |
| ---------------- | ----------------------------------------------------------------------- |
| Recovery         | Money collected from shopkeepers for previously delivered stock         |
| Expense          | Money spent (staff food, salary, utility bills, etc.)                   |
| Bank Slip        | Cash deposited to the bank (a transfer — NOT a real expense)            |
| Owner Drawing    | Personal money taken out by owners Waqar, Waqas, or for Home           |
| Opening Balance  | Cash on hand at the start of the day (previous day's closing balance)   |
| Closing Balance  | Cash remaining at end of day after all recovery and expenses            |
| Coins            | Physical cash counted at end of day for reconciliation                  |
| System Recovery  | Recovery amounts tracked by an external system (memo field only)        |
| Claims           | Stock return or damage claims from shops                                |

---

## Physical Register Structure

The physical book has 5 sections per day. The software must replicate this layout.

### Section 1 — Daily Income (Recovery)

| Salesman       | Cash Amount | Cheque / Online | Remarks | System Recovery |
| -------------- | ----------- | --------------- | ------- | --------------- |
| Opening Balance|             |                 |         |                 |
| Cash Sale      |             |                 |         | (rarely used)   |
| Khalid         | 150,000     |                 |         |                 |
| Khalid         | 155,759     |                 |         |                 |
| Shahid Ali     | 1,131,276   |                 |         |                 |
| Shakeel        | 207,517     |                 |         |                 |
| Amanullah      | 218,635     |                 |         |                 |
| Dhani Bux      | 10,873      |                 |         |                 |
| **Total**      | **1,952,413**|                |         |                 |
| Coins Counted  | 1,952,508   |                 |         |                 |

Notes:
- Same salesman can appear multiple times per day (morning and evening rounds)
- Opening Balance = previous day's closing balance (auto-filled by app)
- Cash Sale row is rarely used — keep as optional entry type. Treat it as a **Recovery entry with Salesman Name = "Cash Sale"**. No special handling required — it uses the same Add Recovery form.

### Section 2 — Cheque Tracking

| Cheque Received | Party Name | Cleared (Yes/No) |
| --------------- | ---------- | ---------------- |
|                 |            |                  |

### Section 3 — Claims

| Claim Description | Amount | Remarks |
| ----------------- | ------ | ------- |
|                   |        |         |

### Section 4 — Cash Denomination Count

| Note/Coin | Quantity | Total |
| --------- | -------- | ----- |
| 5,000 ×   |          |       |
| 1,000 ×   |          |       |
| 500 ×     |          |       |
| 100 ×     |          |       |
| 50 ×      |          |       |
| 20 ×      |          |       |
| 10 ×      |          |       |
| **Total** |          |       |

### Section 5 — Daily Expenses

| Category         | Amount                   |
| ---------------- | ------------------------ |
| Supply & Booking | 420 + 1,960 + 400        |
| Food / Tea       | 160 + 550 + 110          |
| Stationery       |                          |
| Waqar (Owner)    |                          |
| Waqas (Owner)    |                          |
| Zakat / Sadqa    |                          |
| Home             |                          |
| Advance          |                          |
| Salary           | 153,200                  |
| Utility Bills    | 138,000 + 90,000         |
| Bank Slip        | 70,870 + 212,000         |
| Bank Slip        | 60,000 + 50,000 + 1,270  |
| Labour           |                          |
| Others           | 100,000                  |
| **Total**        | **1,952,509**            |

---

## Tech Stack

> This is fixed. Do not change the tech stack.

| Layer       | Technology                          | Notes                                      |
| ----------- | ----------------------------------- | ------------------------------------------ |
| Backend     | **Python 3.11 + Flask**             | Simple web framework. Runs locally.        |
| Database    | **SQLite** (plain file, no server)  | One `.db` file. No encryption in Phase 1.  |
| Frontend    | **HTML + CSS + Vanilla JavaScript** | No React, no Vue. Plain browser pages.     |
| Environment | **Windows 11 laptop (local only)**  | All runs on laptop. No internet needed.    |
| Browser     | **Chrome or Edge**                  | Already installed on Windows 11.           |
| Port        | `http://localhost:8000`             | App runs on this address.                  |

### Required Software

| Software | Version  | Where to Download               |
| -------- | -------- | ------------------------------- |
| Python   | 3.11.x   | https://www.python.org/downloads — **Do NOT use Microsoft Store version** |
| Flask    | Latest   | Installed via `pip install flask` |
| SQLite   | Built-in | Comes with Python — no separate install needed |
| Chrome   | Any      | https://www.google.com/chrome  |

---

## Development Phases

> **Rule:** Build ONLY the current phase. Do not add any feature from a later phase. Wait for owner confirmation before starting the next phase.

| Phase | Name                         | What It Delivers                                     |
| ----- | ---------------------------- | ---------------------------------------------------- |
| **1** | MVP — Core Daily Entry       | Login + add recovery & expense + see totals + SQLite |
| **2** | Full Register Features       | Salesmen, cash count, bank slips, cheques, categories|
| **3** | Backup                       | Manual export to file, USB, simple local backup      |
| **4** | Phone Access & UI Polish     | WiFi access from phone, better design                |

---

## Phase 1 — Detailed Spec

### What Phase 1 Is

Phase 1 is the **absolute minimum** needed to replace the paper register for daily use. Nothing more.

The owner must be able to:
1. Open the app in a browser
2. Log in
3. Add today's recovery amounts (which salesman brought how much)
4. Add today's expenses (what was spent on what)
5. See the totals and closing balance — automatically calculated

That is all. Everything else is Phase 2 or later.

---

### What Phase 1 Includes

| Feature                  | Details                                                                |
| ------------------------ | ---------------------------------------------------------------------- |
| Login screen             | Username + password. Default: `admin` / `admin123`.                   |
| Force password change    | On first login, user MUST change the default password.                 |
| Session                  | User stays logged in until they close browser or click Logout.         |
| Daily entry page         | One page showing today's entries and totals.                           |
| Date                     | Auto-filled with today's date. User can change it if needed.           |
| Add recovery entry       | Salesman name (text) + amount + optional notes. Save button.           |
| Add expense entry        | Description (text) + amount + optional notes. Save button.             |
| Show daily totals        | Total Recovery, Total Expenses, Closing Balance — updated after each entry. |
| Previous / Next day      | Buttons to navigate to other days.                                     |
| Opening balance          | Set manually on first use. Then auto-carried from previous day.        |
| SQLite database          | All data saved to `C:\WaqarBrothers\data\accounts.db`                 |
| Auto-start               | App starts automatically when Windows boots (Task Scheduler).          |
| Desktop shortcut         | Double-click opens app in browser (`http://localhost:8000`).           |
| install.bat              | One script that sets up everything. User double-clicks it once.        |
| README.txt               | Simple plain-English instructions (no technical language).             |

---

### What Phase 1 Does NOT Include

> If a feature is not in the list above, it is NOT in Phase 1. Do not build it.

- ❌ Salesman profiles or management
- ❌ Expense categories (just free text description in Phase 1)
- ❌ Cash denomination counter
- ❌ Bank slip photo upload
- ❌ Cheque tracker
- ❌ Claims tracker
- ❌ Reports or exports
- ❌ Backup system (beyond the raw database file)
- ❌ Phone/WiFi access
- ❌ Database encryption
- ❌ Google Drive, email, or any cloud connection
- ❌ Advanced UI design or animations

---

## Database Schema

> This is the Phase 1 database schema. Keep it exactly like this. Do not add extra tables or columns in Phase 1.

### Table: `users`

Stores the single owner login.

| Column               | Type    | Details                                                                   |
| -------------------- | ------- | ------------------------------------------------------------------------- |
| id                   | INTEGER | Primary key, auto-increment                                               |
| username             | TEXT    | The login username (e.g., `admin`)                                        |
| password             | TEXT    | Hashed password — NEVER store as plain text                               |
| must_change_password | INTEGER | `1` = must change password on next login, `0` = no. Default: `1`         |
| failed_attempts      | INTEGER | Count of consecutive wrong password attempts. Default: `0`                |
| locked_until         | TEXT    | ISO datetime string — NULL if not locked (e.g., `2026-04-01 14:45:00`)   |

> Note on password: Use Python's `hashlib` (SHA-256) or `werkzeug.security` to hash the password before saving. Never store raw passwords.

### Table: `daily_entries`

Stores every recovery and expense entry.

| Column      | Type    | Details                                                                        |
| ----------- | ------- | ------------------------------------------------------------------------------ |
| id          | INTEGER | Primary key, auto-increment                                                    |
| date        | TEXT    | Format: `YYYY-MM-DD` (e.g., `2026-03-31`)                                     |
| type        | TEXT    | Either `recovery` or `expense`                                                 |
| amount      | INTEGER | The amount in PKR. Always whole numbers — no decimals.                         |
| description | TEXT    | Salesman name (for recovery) or what was spent (for expense)                   |
| notes       | TEXT    | Optional extra notes                                                           |
| is_deleted  | INTEGER | `0` = active (visible), `1` = deleted (hidden). Default: `0`. Never hard-delete. |
| created_at  | TEXT    | Datetime entry was saved. Format: `YYYY-MM-DD HH:MM:SS`. Auto-set by the app. |

### Table: `settings`

Stores app configuration values.

| Column | Type | Details                                                                          |
| ------ | ---- | -------------------------------------------------------------------------------- |
| key    | TEXT | **PRIMARY KEY** — the setting name (unique). Always use `INSERT OR REPLACE`.    |
| value  | TEXT | Setting value                                                                    |

**Required settings for Phase 1:**

| Key              | Example Value  | Purpose                                 |
| ---------------- | -------------- | --------------------------------------- |
| `business_name`  | Waqar & Brothers | Shown at top of daily page             |
| `opening_balance`| 500000         | Starting cash (set during first-time setup) |
| `fy_start`       | 2025-07-01     | Financial year start date               |
| `fy_end`         | 2026-06-30     | Financial year end date                 |

### Required Indexes (Phase 1)

Create these indexes during database setup (`setup_db.py`). They ensure the daily page loads fast even after years of data.

```sql
CREATE INDEX idx_entries_date ON daily_entries(date, is_deleted);
CREATE INDEX idx_entries_type ON daily_entries(date, type, is_deleted);
```

### Phase 2+ Tables (Do NOT build in Phase 1)

These tables are added in later phases:

- `salesmen` — salesman profiles and targets
- `expense_categories` — categorised expenses
- `bank_slip_photos` — bank slip photo records
- `cheques` — cheque tracking
- `claims` — stock return / damage claims
- `cash_counts` — denomination counter records
- `audit_log` — full history of every change
- `backup_log` — backup history

---

## User Flow

This is the complete flow a user follows every day in Phase 1.

```
Step 1 — Open the app
    User double-clicks the desktop shortcut
    → Chrome/Edge opens automatically
    → App loads at http://localhost:8000

Step 2 — Login
    User sees the login screen
    → Enters username: admin
    → Enters password: [their password]
    → Clicks "Login"
    → App verifies credentials
    → Redirects to the Daily Page

Step 3 — View today's page
    User lands on the Daily Page
    → Date shown at top (today, e.g., 01/04/2026 — Tuesday)
    → Opening Balance shown (carried from previous day)
    → List of today's recovery entries (empty at start of day)
    → List of today's expense entries (empty at start of day)
    → Totals shown at bottom: Recovery = 0, Expenses = 0, Balance = Opening Balance

Step 4 — Add a recovery entry
    User clicks the [+ Add Recovery] button
    → A short form appears:
        Date: [auto-filled, today]
        Salesman Name: [text input]
        Amount: [number input]
        Notes: [optional text]
    → User fills in: "Khalid" / "150000" / (blank)
    → Clicks [Save]
    → Entry appears instantly in the recovery list
    → Total Recovery updates instantly (PKR 1,50,000)
    → Closing Balance recalculates instantly

Step 5 — Add more entries
    User repeats Step 4 for each salesman
    User clicks [+ Add Expense] for each expense
    → Same short form with: Date / Description / Amount / Notes
    → Each saved entry appears in the list
    → Totals update after every entry

Step 6 — End of day
    User reviews the daily page
    → Confirms totals look correct
    → Closing Balance = Opening Balance + Total Recovery - Total Expenses
    → This closing balance automatically becomes tomorrow's opening balance

Step 7 — Logout (optional)
    User clicks [Logout]
    → Redirected back to login screen
    → Data is already saved — nothing is lost
```

---

## UI Requirements

### Phase 1 Design Goals

- **Simple and functional.** No need for fancy design in Phase 1.
- **Large, readable text.** The owner may use it on a laptop at a shop counter.
- **PKR formatting** on all amounts. Example: `PKR 1,52,000` (lakh-crore system).
- **Clean layout.** No clutter. Every button and label has one clear purpose.

### Daily Page Layout

The page must look like this (recreate this as closely as possible in HTML):

```
╔══════════════════════════════════════════════════════════════╗
║        WAQAR & BROTHERS — DAILY ACCOUNT BOOK                ║
║   Date: Tuesday, 01 April 2026     [◀ Yesterday] [Tomorrow ▶]║
╠══════════════════════════════════════════════════════════════╣
║  Opening Balance:  PKR 5,00,000                              ║
╠══════════════════════════════════════════════════════════════╣
║  📥 RECOVERY                              [+ Add Recovery]   ║
║  ──────────────────────────────────────────────────────────  ║
║  #  Salesman        Amount          Notes         Action     ║
║  1  Khalid          PKR 1,50,000                 [Edit][Del] ║
║  2  Khalid          PKR 1,55,759                 [Edit][Del] ║
║  3  Shahid Ali      PKR 11,31,276                [Edit][Del] ║
║  4  Shakeel         PKR 2,07,517                 [Edit][Del] ║
║  5  Amanullah       PKR 2,18,635                 [Edit][Del] ║
║  6  Dhani Bux       PKR 10,873                   [Edit][Del] ║
║  ──────────────────────────────────────────────────────────  ║
║  TOTAL RECOVERY:    PKR 18,74,060                            ║
╠══════════════════════════════════════════════════════════════╣
║  📤 EXPENSES                              [+ Add Expense]    ║
║  ──────────────────────────────────────────────────────────  ║
║  #  Description     Amount          Notes         Action     ║
║  1  Food / Tea      PKR 820                      [Edit][Del] ║
║  2  Salary          PKR 1,53,200                 [Edit][Del] ║
║  3  Waqar Drawing   PKR 50,000                   [Edit][Del] ║
║  4  Bank Slip       PKR 2,82,870                 [Edit][Del] ║
║  ──────────────────────────────────────────────────────────  ║
║  TOTAL EXPENSES:    PKR 4,86,890                             ║
╠══════════════════════════════════════════════════════════════╣
║  💰 DAILY SUMMARY                                            ║
║  Opening Balance:   PKR  5,00,000                            ║
║  + Total Recovery:  PKR 18,74,060                            ║
║  − Total Expenses:  PKR  4,86,890                            ║
║  = Closing Balance: PKR 19,87,170                            ║
╚══════════════════════════════════════════════════════════════╝
```

### Add Recovery Form

A simple popup or section that appears when [+ Add Recovery] is clicked:

```
┌─────────────────────────────────────────┐
│  Add Recovery Entry                      │
│                                          │
│  Date:          [ 2026-04-01        ]    │
│  Salesman Name: [ _________________ ]    │
│  Amount (PKR):  [ _________________ ]    │
│  Notes:         [ _________________ ]    │
│                                          │
│         [Cancel]    [Save Entry]         │
└─────────────────────────────────────────┘
```

### Add Expense Form

```
┌─────────────────────────────────────────┐
│  Add Expense Entry                       │
│                                          │
│  Date:          [ 2026-04-01        ]    │
│  Description:   [ _________________ ]    │
│  Amount (PKR):  [ _________________ ]    │
│  Notes:         [ _________________ ]    │
│                                          │
│         [Cancel]    [Save Entry]         │
└─────────────────────────────────────────┘
```

### Navigation Bar

Show at the top of every page:

```
[ 🏠 Daily Page ]  [ ⚙️ Settings ]  [ 🔓 Logout ]
```

### Login Page

```
┌──────────────────────────────────────────┐
│        WAQAR & BROTHERS                  │
│       Daily Account Book                 │
│                                          │
│  Username:  [ ______________________ ]   │
│  Password:  [ ______________________ ]   │
│                                          │
│            [ Login ]                     │
│                                          │
│  ⚠️ After 5 wrong attempts: locked       │
│     for 15 minutes.                      │
└──────────────────────────────────────────┘
```

---

## Phase 2 — Detailed Spec

> Build Phase 2 ONLY after Phase 1 is confirmed working by the owner.

### What Phase 2 Adds

| Feature                | Details                                                              |
| ---------------------- | -------------------------------------------------------------------- |
| Salesman profiles      | Add/edit/deactivate salesmen with name, phone, route, daily target   |
| Recovery dropdown      | Replace text input with dropdown of saved salesmen                   |
| Performance tracking   | Show actual recovery vs target per salesman                          |
| Cash/Cheque/Online     | Split recovery entry into 3 amount columns                           |
| Expense categories     | Replace text input with dropdown of categories (see list below)      |
| Cash denomination count| Enter quantity per note denomination → auto-total → compare expected |
| Discrepancy alert      | Show ⚠️ if counted cash ≠ expected cash                             |
| Bank slip photos       | Upload photo when adding a Bank Slip expense entry                   |
| Cheque tracker         | Record cheques received → deposited → cleared → bounced              |
| Claims tracker         | Record stock return / damage claims with status                      |
| Edit & delete          | Full edit and delete with undo (soft delete only — record kept)      |
| Audit trail            | Every change logged with timestamp and old/new values                |

### Phase 2 Expense Categories

| Category         | Type             | Notes                                           |
| ---------------- | ---------------- | ----------------------------------------------- |
| Supply & Booking | Business Expense | Delivery and logistics cost                     |
| Food / Tea       | Business Expense | Daily food for staff                            |
| Stationery       | Business Expense | Office supplies                                 |
| Salary           | Business Expense | Staff salary payments                           |
| Utility Bills    | Business Expense | Electricity, gas, water, phone                  |
| Labour           | Business Expense | Daily wage workers                              |
| Advance          | Business Expense | Advance payments to staff                       |
| Zakat / Sadqa    | Charity          | Religious giving                                |
| Waqar (Owner)    | Personal Drawing | Owner withdrawal                                |
| Waqas (Owner)    | Personal Drawing | Owner withdrawal                                |
| Home             | Personal Drawing | Household expenses from business                |
| Bank Slip        | Bank Transfer    | Deposit to bank (NOT a real expense)            |
| Others           | Miscellaneous    | Anything not listed                             |

> ⚠️ **Critical rule (Phase 2+):** The app must separate expenses into these 4 groups in all summaries:
> - **Business Expenses** — used for Profit/Loss calculation
> - **Personal Drawings** — owner withdrawals (Waqar + Waqas + Home)
> - **Bank Transfers** — Bank Slip entries (cash moved to bank)
> - **Charity** — Zakat / Sadqa
>
> **Profit/Loss = Total Recovery − Business Expenses ONLY**

### Phase 2 Closing Balance Formula (Updated)

```
Closing Balance = Opening Balance
               + Cash Recovery
               − Business Expenses
               − Personal Drawings
               − Bank Transfers
```

> Note: Cheque and Online recoveries do NOT add to physical cash balance.

---

## Phase 3 — Backup

> Build Phase 3 ONLY after Phase 2 is confirmed working by the owner.

### Backup Philosophy

Keep backup simple. No automation in Phase 3. The owner manually exports and saves the database file.

### Phase 3 Backup Features

| Feature               | How It Works                                                           |
| --------------------- | ---------------------------------------------------------------------- |
| Manual export         | Settings page shows [Download Backup] button. Saves the `.db` file.   |
| Save to USB           | Owner plugs in USB → clicks [Download Backup] → manually copies to USB |
| Save to Google Drive  | Owner downloads the backup file → manually drags it to Google Drive folder in browser |
| No automation         | No scheduled tasks. No API connections. Owner does it manually.        |

### Where the Database File Lives

```
C:\WaqarBrothers\data\accounts.db
```

This single file IS the entire database. Backing it up means copying this one file.

### Restore from Backup

Settings page shows [Restore from Backup] button:
1. User selects the `.db` backup file
2. App uploads it to a temporary location (`C:\WaqarBrothers\data\restore_temp.db`)
3. App validates the uploaded file is a valid SQLite database (not corrupt or wrong file type)
4. App shows confirmation: "This will replace ALL current data with the backup. Are you sure?"
5. App shuts down the Flask server
6. A helper script (`restore.bat`) replaces `accounts.db` with the uploaded file and restarts Flask
7. App opens in browser with all data from the backup restored

> **Why this sequence:** On Windows, the database file is locked while Flask is using it. The app must stop Flask first, then swap the file, then restart. The AI must create a `restore.bat` script that handles this.

### What Is NOT in Phase 3

- ❌ Google Drive API / automatic sync
- ❌ Email backup
- ❌ Scheduled nightly backup
- ❌ Encrypted backup files
- ❌ Cloud storage of any kind

> These can be added in a future Phase 5 if the owner requests.

---

## Phase 4 — Phone Access

> Build Phase 4 ONLY after Phase 3 is confirmed working by the owner.

### How Phone Access Works

The app already runs on `http://localhost:8000` on the laptop. To access it from a phone on the same WiFi, we just change the app to listen on the local network address.

### Steps to Enable

1. Owner goes to Settings → clicks [Enable Phone Access]
2. App shows the laptop's local IP address (e.g., `192.168.1.5`)
3. Owner types `http://192.168.1.5:8000` in the phone's browser
4. The same app appears — login required
5. Everything works the same as on laptop

### What Phase 4 Includes

| Feature                | Details                                                           |
| ---------------------- | ----------------------------------------------------------------- |
| LAN access toggle      | Settings button to enable / disable phone access                  |
| Show IP address        | App displays the exact URL to type on the phone                   |
| Mobile-friendly layout | Pages adjust to phone screen size (responsive CSS)                |
| Camera capture         | On phone: tap button to take photo of bank slip with camera       |
| Same login             | Phone uses same username and password as laptop                   |

### What Is NOT in Phase 4

- ❌ Public internet access (no hosting, no domain name)
- ❌ Separate phone app
- ❌ Any cloud or external server

---

## Business Rules

These rules apply across all phases. The AI must follow them exactly.

| # | Rule                                                                                         |
|---|----------------------------------------------------------------------------------------------|
| 1 | **Financial year** is always July 1 to June 30.                                              |
| 2 | **Opening Balance** = cash physically in hand. Does NOT include money in the bank.           |
| 3 | **Bank Slip entries are NOT expenses.** They are cash moved to the bank. Track separately.   |
| 4 | **Owner drawings are NOT business expenses.** Waqar, Waqas, Home are personal — separate.   |
| 5 | **Profit/Loss = Total Recovery − Business Expenses ONLY.** Drawings and bank transfers excluded.|
| 6 | Same salesman can have **multiple recovery entries per day** (morning + evening rounds).     |
| 7 | Cheque and Online recoveries do **not** add to physical cash balance (they go to bank).      |
| 8 | **Closing Balance** automatically becomes the next day's Opening Balance.                   |
| 9 | **System Recovery** is a memo-only flag. It does not change any totals.                     |
| 10| **Soft delete only.** Deleted entries are hidden but never erased from the database.         |
| 11| **Gap days (no entries).** If no entries exist for a day (e.g., a weekend or holiday), skip it entirely — do NOT create empty records for gap days. The opening balance for any day is always the closing balance of the most recent prior day that has at least one entry. The walk-back query in Step 5 handles this automatically. |

---

## Validation Rules

These rules apply to every entry form in every phase.

| Rule                                             | What Happens                                      |
| ------------------------------------------------ | ------------------------------------------------- |
| Amount is empty or zero                          | Block entry. Show error: "Amount must be greater than 0." |
| Amount is more than 1 crore (1,00,00,000)        | Show warning. Allow if owner confirms.            |
| Date is in the future                            | Block entry. Show error: "Future dates are not allowed." |
| Date is outside the current financial year       | Show warning. Allow if owner confirms.            |
| Salesman name is empty (recovery entry)          | Block entry. Show error: "Salesman name is required." |
| Description is empty (expense entry)             | Block entry. Show error: "Description is required." |
| Same salesman + same amount + same date          | Show warning: "Possible duplicate entry." Allow if confirmed. |
| Closing balance goes negative                    | When saving an entry that would make the closing balance negative: show an inline warning below the Save button: "⚠️ Warning: This will make today's closing balance negative (PKR -X,XX,XXX). Are you sure?" with [Save Anyway] and [Cancel] buttons. Also: on the daily page, show the closing balance number in **red text** whenever it is negative. Do not block the entry — the owner may have a valid reason. |
| Login: wrong password                            | Show error. Count attempt. Lock after 5 failures for 15 minutes. |
| Photo file too large (> 10 MB)                   | Show error: "Photo too large. Maximum size is 10 MB." |
| Photo is wrong file type                         | Show error: "Only JPG, PNG, and HEIC are accepted." |

---

## Currency Formatting

> All amounts in the app must use **Pakistani Rupee (PKR)** with the **South Asian lakh/crore format**.

| Value          | Display As       |
| -------------- | ---------------- |
| 50,000         | PKR 50,000       |
| 150,000        | PKR 1,50,000     |
| 1,500,000      | PKR 15,00,000    |
| 10,000,000     | PKR 1,00,00,000  |
| 1,952,413      | PKR 19,52,413    |

Rules:
- No decimal places (whole numbers only — PKR has no significant paisa in this business)
- Always show `PKR` prefix
- Use comma separators in the South Asian format (ones, then thousands, then lakhs)

---

## Rules for AI Developer

These rules apply to every phase. Follow them exactly.

| # | Rule                                                                                        |
|---|---------------------------------------------------------------------------------------------|
| 1 | Give **full working code only.** No placeholders. No "TODO" comments. No "add your logic here."|
| 2 | Write code with **clear comments** in simple English so a beginner can understand each part. |
| 3 | **Explain every step** before running it. Assume the user has zero coding experience.        |
| 4 | **Build only the current phase.** Do not add any feature from a later phase.                |
| 5 | After each phase, **stop and wait** for the owner to confirm it's working before moving on. |
| 6 | If the user reports an error, **fix it step by step** with exact terminal commands or file edits.|
| 7 | **Never store passwords as plain text.** Always hash them using `werkzeug.security` or `hashlib`.|
| 8 | **All SQL inputs must be sanitised.** Use parameterised queries — never string concatenation in SQL.|
| 9 | **Tech stack is locked.** Python 3.11 + Flask + plain SQLite + HTML/CSS/Vanilla JS. Do not change.|
| 10| **Phase 1 uses plain SQLite.** Do not add encryption or any database library beyond `sqlite3`.|
| 11| All amounts must be formatted as **PKR with lakh/crore commas** (e.g., `PKR 19,52,413`).|
| 12| Financial year is **July 1 to June 30.** Use this in all date logic.|
| 13| Install instructions are for **Windows 11 only.** No Linux or Mac steps.|
| 14| Auto-start is via **Windows Task Scheduler.** Set this up in `install.bat`.|
| 15| The `install.bat` must be a **double-click install** — no typing in terminal for the user.|
| 16| `README.txt` must be in **plain English** — no code, no terminal commands visible to user.|
| 17| The daily page must **visually match** the layout diagram shown in UI Requirements.|
| 18| Every saved entry must appear on screen **immediately** without a page reload (use fetch/AJAX or page redirect).|
| 19| **Phase 3 backup is manual only.** No scheduled tasks, no API calls, no Google Drive integration.|
| 20| **Phase 4 is phone access.** Do not implement any network/LAN features before Phase 4.|
| 21| **Flask session config:** Set `SESSION_PERMANENT = False` in `app.py`. Session ends when the browser closes. No auto-logout timer needed. Generate a random `SECRET_KEY` once during `install.bat` setup and store it in a local `config.py` file — import it into `app.py`. Never hardcode the secret key directly in `app.py`.|

---

## Start Task

**You are now starting Phase 1. Build only Phase 1. Stop after Phase 1. Wait for confirmation.**

### What to Build (in this exact order)

**Step 1 — Set up the project**

- Create the folder: `C:\WaqarBrothers\`
- Create sub-folders: `app\`, `data\`, `logs\`
- Create `app\app.py` (main Flask application)
- Create `app\templates\` folder for HTML files
- Create `app\static\` folder for CSS/JS files
- Create `install.bat` at `C:\WaqarBrothers\install.bat`
- Create `start.bat` at `C:\WaqarBrothers\start.bat`
- Create `README.txt` at `C:\WaqarBrothers\README.txt`

**Step 2 — Create the database**

- Create `C:\WaqarBrothers\data\accounts.db` using plain SQLite
- Create the 3 tables: `users`, `daily_entries`, `settings`
- Insert the default admin user: username = `admin`, password = hashed `admin123`, must_change = true
- Insert default settings: `business_name`, `opening_balance` (0), `fy_start` (`2025-07-01`), `fy_end` (`2026-06-30`)

**Step 3 — Build the login page**

- Route: `GET /` → redirect to `/login` if not logged in
- Route: `GET /login` → show login form
- Route: `POST /login` → check username and hashed password → start session → redirect to `/daily`
- If `must_change_password` is true → redirect to `/change-password` instead
- Track failed attempts in the `users` table — lock for 15 minutes after 5 failures
- Route: `GET /logout` → clear session → redirect to `/login`

**Step 4 — Build the change password page**

- Route: `GET /change-password` → show form with: New Password + Confirm Password
- Route: `POST /change-password` → validate (min 8 chars, both match) → hash new password → update `users` table → set `must_change_password` = false → redirect to `/daily`

**Step 5 — Build the daily page**

- Route: `GET /daily` → show today's entries
- Route: `GET /daily?date=2026-03-31` → show a specific day's entries
- Query `daily_entries` for the date
- Calculate and show:
  - **Opening Balance logic:** Query the most recent prior date that has at least one non-deleted entry (walk backwards — do NOT just use `date - 1`). Use that day's closing balance as today's opening balance. If no prior entries exist at all, use the `opening_balance` value from the `settings` table.
  - Total Recovery (sum of all `type = 'recovery'` entries for the date where `is_deleted = 0`)
  - Total Expenses (sum of all `type = 'expense'` entries for the date where `is_deleted = 0`)
  - Closing Balance = Opening Balance + Total Recovery − Total Expenses
- Show Previous Day and Next Day buttons

**Step 6 — Build Add Recovery**

- Route: `POST /add-entry` with `type = 'recovery'`
- Required fields: `date`, `description` (salesman name), `amount`
- Optional: `notes`
- Validate: amount > 0, description not empty, date not in future
- Save to `daily_entries` table
- Redirect back to `/daily?date=<date>`

**Step 7 — Build Add Expense**

- Route: `POST /add-entry` with `type = 'expense'`
- Required fields: `date`, `description` (what was spent on), `amount`
- Optional: `notes`
- Validate: amount > 0, description not empty, date not in future
- Save to `daily_entries` table
- Redirect back to `/daily?date=<date>`

**Step 8 — Build Edit and Delete**

- Route: `GET /edit-entry/<id>` → show edit form pre-filled with existing values
- Route: `POST /edit-entry/<id>` → validate → update `daily_entries` table → redirect to daily page
- Route: `POST /delete-entry/<id>` → soft delete: set `is_deleted = 1` in `daily_entries` → redirect to daily page
  > ⚠️ **Important:** The `[Del]` button in the HTML must be inside a `<form method="POST">` — never an `<a href>` link. A plain link can be accidentally triggered by browser prefetch and would delete data silently.

**Step 9 — Build Settings page (basic)**

- Route: `GET /settings` → show form with: Business Name, Opening Balance
- Route: `POST /settings` → save to `settings` table
- Also show the app version and a note: "Backup and advanced settings coming in Phase 3"
- `fy_start` and `fy_end` are **not editable via UI in Phase 1.** They are written as defaults during database creation (`2025-07-01` / `2026-06-30`) and used only in the date validation logic. No form field is needed for them.

**Step 10 — Set up auto-start and shortcuts**

- `install.bat` must do:
  1. Check if Python is installed by running `python --version`. If the command fails or the version is not 3.x, display the following message using `echo` and then `pause` and `exit`:
     ```
     ERROR: Python 3.11 is not installed.
     Please download it from: https://www.python.org/downloads
     IMPORTANT: During install, tick the box that says "Add Python to PATH".
     After installing Python, double-click install.bat again.
     ```
     Do NOT proceed with any further steps if Python is missing.
  2. Install Flask using pip: `pip install flask`
  3. Run `python setup_db.py` to create the database and tables. This script must exist at `C:\WaqarBrothers\app\setup_db.py` and is created as part of Step 2.
  4. Create desktop shortcut that opens `http://localhost:8000` in Chrome/Edge
  5. Register a Windows Task Scheduler task to run `start.bat` at Windows boot
  6. Show success message: "Setup complete! Click the desktop shortcut to open the app."
- `start.bat` must:
  - Navigate to `C:\WaqarBrothers\app\`
  - Start Flask in the background and redirect all output to the log file: `start /B python app.py >> C:\WaqarBrothers\logs\app.log 2>&1`
  - Wait 3 seconds for Flask to finish starting before opening the browser: `timeout /t 3 /nobreak > nul`
  - Open `http://localhost:8000` in the default browser: `start http://localhost:8000`
  > Note: The `logs\` folder is created by `install.bat` in Step 1. The log file records all Flask errors — if the app doesn't open, check `C:\WaqarBrothers\logs\app.log` for the cause.

**Step 11 — Write README.txt**

Write in plain English with these sections:
- **First Time Setup:** Double-click `install.bat` to install and set up the app. This only needs to be done once. Follow any messages on screen.
- How to open the app (click the desktop shortcut — it opens automatically after setup)
- How to log in (default: admin / admin123 — you must change it on first login)
- How to add a recovery entry
- How to add an expense entry
- How to go to a previous day
- What to do if the app doesn't open (restart the laptop first; if still not working, double-click `start.bat` to start it manually)
- Where the database file is saved (`C:\WaqarBrothers\data\accounts.db`)
- **Important:** Never delete the file `accounts.db` — it contains all your data.

---

### Phase 1 Completion Checklist

Before moving to Phase 2, verify ALL of the following:

- [ ] `install.bat` runs without any errors on Windows 11
- [ ] App auto-starts when Windows boots (verify by restarting the laptop)
- [ ] Desktop shortcut opens app at `http://localhost:8000`
- [ ] Login page appears correctly
- [ ] Default login admin / admin123 is rejected if password not changed
- [ ] Password change is forced on first login
- [ ] Changed password works for subsequent logins
- [ ] Wrong password 5 times → app locks for 15 minutes
- [ ] Daily page shows today's date and Previous/Next Day buttons work
- [ ] Opening balance shows correctly on the daily page
- [ ] Add Recovery form saves entry and it appears in the list immediately
- [ ] Add Expense form saves entry and it appears in the list immediately
- [ ] Total Recovery, Total Expenses, and Closing Balance calculate correctly
- [ ] Closing balance from Day 1 becomes Day 2's opening balance
- [ ] Edit an entry → changes are saved and shown correctly
- [ ] Delete an entry → it disappears from the list (soft delete)
- [ ] PKR formatting shows correctly (e.g., PKR 1,52,000 not 152000)
- [ ] Settings page saves business name and opening balance

**Do NOT start Phase 2 until all boxes above are checked and owner confirms: "Phase 1 is working."**
