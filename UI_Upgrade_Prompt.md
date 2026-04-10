# UI Upgrade Prompt for Claude Code
## Copy everything below this line and paste into Claude Code

---

Upgrade the UI of my Daily Account Book app to a modern, professional design. Keep all functionality exactly the same — only change the look and feel.

**IMPORTANT:**
- Do NOT change any Flask routes, database logic, or Python code
- Only modify: HTML templates, CSS (style.css), and JavaScript (if needed for theme toggle)
- Keep all forms, buttons, and features working exactly as they are

---

## 1. THEME SYSTEM — Light & Dark Mode

Add a **theme toggle button** (sun/moon icon) in the navigation bar. User clicks it to switch between light and dark mode. Save their preference in `localStorage` so it remembers after browser restart.

### Dark Theme Colors (Default)

```css
[data-theme="dark"] {
    --bg: #0a0f1a;
    --surface: #111827;
    --surface2: #1e293b;
    --border: #1e293b;
    --border2: #334155;
    --text: #e2e8f0;
    --text2: #94a3b8;
    --text3: #64748b;
    --green: #34d399;
    --green-bg: rgba(52, 211, 153, 0.1);
    --red: #f87171;
    --red-bg: rgba(248, 113, 113, 0.1);
    --blue: #60a5fa;
    --blue-bg: rgba(96, 165, 250, 0.1);
    --accent: #22d3ee;
    --accent-bg: rgba(34, 211, 238, 0.08);
    --shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
}
```

### Light Theme Colors

```css
[data-theme="light"] {
    --bg: #f1f5f9;
    --surface: #ffffff;
    --surface2: #f8fafc;
    --border: #e2e8f0;
    --border2: #cbd5e1;
    --text: #1e293b;
    --text2: #475569;
    --text3: #94a3b8;
    --green: #059669;
    --green-bg: rgba(5, 150, 105, 0.08);
    --red: #dc2626;
    --red-bg: rgba(220, 38, 38, 0.08);
    --blue: #2563eb;
    --blue-bg: rgba(37, 99, 235, 0.08);
    --accent: #0891b2;
    --accent-bg: rgba(8, 145, 178, 0.06);
    --shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
}
```

### Theme Toggle JavaScript

```javascript
// Add to static/js/theme.js or inline in base template
(function() {
    const saved = localStorage.getItem('theme') || 'dark';
    document.documentElement.setAttribute('data-theme', saved);
})();

function toggleTheme() {
    const current = document.documentElement.getAttribute('data-theme');
    const next = current === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', next);
    localStorage.setItem('theme', next);
}
```

### Theme Toggle Button (in navbar)

```html
<button onclick="toggleTheme()" class="theme-toggle" title="Switch theme">
    <!-- Show moon icon in light mode, sun icon in dark mode -->
    <span class="icon-sun">☀️</span>
    <span class="icon-moon">🌙</span>
</button>
```

```css
[data-theme="dark"] .icon-sun { display: none; }
[data-theme="dark"] .icon-moon { display: inline; }
[data-theme="light"] .icon-sun { display: inline; }
[data-theme="light"] .icon-moon { display: none; }
```

---

## 2. TYPOGRAPHY

Add Google Fonts to the base HTML template `<head>`:

```html
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Mono:wght@400;700&display=swap" rel="stylesheet">
```

- **All text:** `font-family: 'DM Sans', sans-serif;`
- **All PKR amounts:** `font-family: 'Space Mono', monospace;` with class `mono`
- Base font size: `15px`
- Line height: `1.5`

---

## 3. GLOBAL STYLES

```css
* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    background: var(--bg);
    color: var(--text);
    font-family: 'DM Sans', sans-serif;
    font-size: 15px;
    line-height: 1.5;
    transition: background 0.3s, color 0.3s;
}

/* Card — used for every content section */
.card {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 24px;
    box-shadow: var(--shadow);
    transition: background 0.3s, border-color 0.3s;
}

/* Monospace for amounts */
.mono {
    font-family: 'Space Mono', monospace;
}

/* Links */
a { color: var(--accent); text-decoration: none; }
a:hover { text-decoration: underline; }
```

---

## 4. PAGE LAYOUT

```css
.page-wrapper {
    max-width: 960px;
    margin: 0 auto;
    padding: 20px 16px 60px;
    min-height: 100vh;
}
```

---

## 5. NAVIGATION BAR

```css
.navbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 6px;
    margin-bottom: 24px;
}

.nav-link {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 10px 18px;
    border-radius: 8px;
    border: none;
    background: transparent;
    color: var(--text3);
    font-family: inherit;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
    transition: all 0.2s;
}

.nav-link:hover {
    color: var(--text);
    background: var(--surface2);
}

.nav-link.active {
    background: var(--accent-bg);
    color: var(--accent);
    border: 1px solid rgba(34, 211, 238, 0.2);
}

.theme-toggle {
    background: var(--surface2);
    border: 1px solid var(--border2);
    border-radius: 8px;
    padding: 8px 12px;
    cursor: pointer;
    font-size: 16px;
    transition: all 0.2s;
}
```

---

## 6. BUTTONS

```css
.btn {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 10px 20px;
    border-radius: 10px;
    border: none;
    font-family: inherit;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s;
}

.btn:hover { transform: translateY(-1px); }

.btn-primary {
    background: var(--accent);
    color: #0a0f1a;
}
.btn-primary:hover { filter: brightness(1.1); }

.btn-recovery {
    background: var(--green-bg);
    color: var(--green);
    border: 1px solid rgba(52, 211, 153, 0.2);
}
.btn-recovery:hover { background: rgba(52, 211, 153, 0.15); }

.btn-expense {
    background: var(--red-bg);
    color: var(--red);
    border: 1px solid rgba(248, 113, 113, 0.2);
}
.btn-expense:hover { background: rgba(248, 113, 113, 0.15); }

.btn-ghost {
    background: transparent;
    color: var(--text2);
    border: 1px solid var(--border2);
}
.btn-ghost:hover { border-color: var(--text2); color: var(--text); }

.btn-danger {
    background: var(--red-bg);
    color: var(--red);
}

.btn-sm { padding: 6px 12px; font-size: 13px; border-radius: 8px; }
```

---

## 7. FORM INPUTS

```css
input, select, textarea {
    background: var(--surface2);
    border: 1px solid var(--border2);
    color: var(--text);
    padding: 10px 14px;
    border-radius: 10px;
    font-family: inherit;
    font-size: 14px;
    outline: none;
    width: 100%;
    transition: border-color 0.2s, background 0.3s;
}

input:focus, select:focus, textarea:focus {
    border-color: var(--accent);
    box-shadow: 0 0 0 3px var(--accent-bg);
}

label {
    display: block;
    font-size: 12px;
    font-weight: 600;
    color: var(--text3);
    margin-bottom: 4px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

/* Amount input — larger and monospace */
input.amount-input {
    font-family: 'Space Mono', monospace;
    font-size: 20px;
    font-weight: 700;
    padding: 12px 14px;
}
```

---

## 8. DAILY PAGE — HEADER

```css
.page-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 24px;
    flex-wrap: wrap;
    gap: 12px;
}

.page-title {
    font-size: 24px;
    font-weight: 700;
    letter-spacing: -0.5px;
}

.page-title .accent {
    color: var(--accent);
}

.page-subtitle {
    font-size: 13px;
    color: var(--text3);
    margin-top: 2px;
}

.date-nav {
    display: flex;
    align-items: center;
    gap: 8px;
}

.date-display {
    font-size: 15px;
    font-weight: 600;
    color: var(--text);
    padding: 8px 16px;
    background: var(--surface2);
    border-radius: 8px;
    border: 1px solid var(--border2);
}
```

---

## 9. OPENING BALANCE BAR

```css
.balance-bar {
    background: var(--accent-bg);
    border: 1px solid rgba(34, 211, 238, 0.15);
    border-radius: 12px;
    padding: 16px 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.balance-label {
    font-size: 13px;
    color: var(--text3);
    text-transform: uppercase;
    letter-spacing: 0.5px;
    font-weight: 600;
}

.balance-amount {
    font-family: 'Space Mono', monospace;
    font-size: 22px;
    font-weight: 700;
    color: var(--accent);
}
```

---

## 10. ENTRY TABLES (Recovery & Expenses)

```css
.section-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 16px;
}

.section-title {
    font-size: 16px;
    font-weight: 700;
    display: flex;
    align-items: center;
    gap: 8px;
}

/* Each entry row — card-style instead of plain table rows */
.entry-row {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 14px 16px;
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px;
    margin-bottom: 8px;
    transition: all 0.15s;
}

.entry-row:hover {
    border-color: var(--border2);
}

/* Color dot indicator */
.entry-dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    flex-shrink: 0;
}

.entry-dot.recovery { background: var(--green); }
.entry-dot.expense { background: var(--red); }

.entry-name {
    flex: 1;
    min-width: 0;
}

.entry-name-text {
    font-size: 14px;
    font-weight: 600;
}

.entry-notes {
    font-size: 12px;
    color: var(--text3);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.entry-amount {
    font-family: 'Space Mono', monospace;
    font-size: 15px;
    font-weight: 700;
    flex-shrink: 0;
}

.entry-amount.recovery { color: var(--green); }
.entry-amount.expense { color: var(--red); }

/* Action buttons inside entries */
.entry-actions {
    display: flex;
    gap: 4px;
    flex-shrink: 0;
}

.entry-actions button, .entry-actions .btn-sm {
    background: var(--surface2);
    border: 1px solid var(--border);
    color: var(--text3);
    padding: 6px 10px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 12px;
    transition: all 0.2s;
}

.entry-actions button:hover {
    color: var(--text);
    border-color: var(--border2);
}

/* Section total */
.section-total {
    display: flex;
    justify-content: space-between;
    padding: 14px 16px;
    background: var(--surface2);
    border-radius: 10px;
    margin-top: 12px;
    font-weight: 700;
}

.section-total .label {
    text-transform: uppercase;
    font-size: 12px;
    letter-spacing: 0.5px;
    color: var(--text2);
}

.section-total .amount {
    font-family: 'Space Mono', monospace;
    font-size: 16px;
}
```

---

## 11. DAILY SUMMARY (Bottom Section)

```css
.daily-summary {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 24px;
    margin-top: 20px;
}

.summary-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
    border-bottom: 1px solid var(--border);
}

.summary-row:last-child {
    border-bottom: none;
    padding-top: 16px;
    margin-top: 8px;
    border-top: 2px solid var(--border2);
}

.summary-label {
    font-size: 14px;
    color: var(--text2);
}

.summary-label .operator {
    display: inline-block;
    width: 20px;
    color: var(--text3);
}

.summary-amount {
    font-family: 'Space Mono', monospace;
    font-size: 16px;
    font-weight: 700;
}

/* Closing balance — larger */
.summary-row.closing .summary-label {
    font-size: 16px;
    font-weight: 700;
    color: var(--text);
}

.summary-row.closing .summary-amount {
    font-size: 22px;
}

/* Negative balance warning */
.summary-amount.negative {
    color: var(--red);
}
```

---

## 12. FORM MODAL (Add Recovery / Add Expense)

```css
.modal-overlay {
    position: fixed;
    inset: 0;
    background: rgba(0, 0, 0, 0.6);
    backdrop-filter: blur(4px);
    z-index: 100;
    display: flex;
    align-items: center;
    justify-content: center;
}

.modal-card {
    background: var(--surface);
    border: 1px solid var(--border2);
    border-radius: 16px;
    padding: 28px;
    width: 100%;
    max-width: 420px;
    margin: 16px;
    animation: slideUp 0.3s ease-out;
}

@keyframes slideUp {
    from { opacity: 0; transform: translateY(12px); }
    to { opacity: 1; transform: translateY(0); }
}

.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.modal-title {
    font-size: 18px;
    font-weight: 700;
}

.modal-close {
    background: none;
    border: none;
    color: var(--text3);
    cursor: pointer;
    font-size: 20px;
    padding: 4px;
}

.form-group {
    margin-bottom: 16px;
}
```

---

## 13. LOGIN PAGE

```css
.login-wrapper {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: var(--bg);
    padding: 20px;
}

.login-card {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 20px;
    padding: 40px;
    width: 100%;
    max-width: 400px;
    text-align: center;
    box-shadow: var(--shadow);
}

.login-title {
    font-size: 22px;
    font-weight: 700;
    margin-bottom: 4px;
}

.login-subtitle {
    font-size: 14px;
    color: var(--text3);
    margin-bottom: 28px;
}

.login-btn {
    width: 100%;
    padding: 14px;
    font-size: 15px;
    font-weight: 700;
    border-radius: 10px;
    margin-top: 8px;
}

.login-warning {
    font-size: 12px;
    color: var(--text3);
    margin-top: 20px;
    padding: 10px;
    background: var(--surface2);
    border-radius: 8px;
}
```

---

## 14. SETTINGS PAGE

```css
.settings-section {
    margin-bottom: 24px;
}

.settings-card {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 24px;
}

.settings-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 16px 0;
    border-bottom: 1px solid var(--border);
}

.settings-row:last-child {
    border-bottom: none;
}
```

---

## 15. ALERT / ERROR MESSAGES

```css
.alert {
    padding: 12px 16px;
    border-radius: 10px;
    margin-bottom: 16px;
    font-size: 14px;
    font-weight: 500;
}

.alert-error {
    background: var(--red-bg);
    color: var(--red);
    border: 1px solid rgba(248, 113, 113, 0.2);
}

.alert-success {
    background: var(--green-bg);
    color: var(--green);
    border: 1px solid rgba(52, 211, 153, 0.2);
}

.alert-warning {
    background: rgba(251, 191, 36, 0.1);
    color: #fbbf24;
    border: 1px solid rgba(251, 191, 36, 0.2);
}
```

---

## 16. RESPONSIVE DESIGN (Phone-Ready for Phase 4)

```css
@media (max-width: 640px) {
    .page-wrapper { padding: 12px 8px 40px; }
    .page-header { flex-direction: column; align-items: flex-start; }
    .card { padding: 16px; border-radius: 12px; }
    .entry-row { padding: 12px; gap: 8px; }
    .entry-amount { font-size: 13px; }
    .balance-amount { font-size: 18px; }
    .modal-card { padding: 20px; margin: 8px; }
    .btn { padding: 8px 14px; font-size: 13px; }
    .section-total .amount { font-size: 14px; }
}
```

---

## 17. IMPLEMENTATION RULES

1. Put ALL CSS in `app/static/css/style.css` — one file, no inline styles
2. Add the theme toggle script in the base template before `</body>`
3. Set `data-theme="dark"` as default on the `<html>` tag
4. Every PKR amount must have class `mono` for monospace font
5. Recovery amounts colored with `var(--green)`, expense amounts with `var(--red)`
6. Use `.card` class for every content section
7. Use `.entry-row` for each individual entry instead of plain `<tr>` rows
8. The [+ Add Recovery] button uses class `btn btn-recovery`
9. The [+ Add Expense] button uses class `btn btn-expense`
10. Do NOT change any Flask routes, Python code, or database logic
11. The app must look good in BOTH themes — test both before finishing
12. Smooth transition when switching themes: `transition: background 0.3s, color 0.3s, border-color 0.3s;` on major elements

---

## Apply this upgrade now. Start with style.css, then update each HTML template one by one. Show me the result after each file is updated.
