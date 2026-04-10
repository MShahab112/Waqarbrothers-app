============================================================
  WAQAR & BROTHERS — Daily Account Book
  User Guide
============================================================


FIRST TIME SETUP
----------------

1. Double-click the file "install.bat" in the C:\WaqarBrothers folder.
2. Wait for it to finish. It will set up everything automatically.
3. When it says "Setup complete!", press any key to close the window.
4. You only need to do this once.


HOW TO OPEN THE APP
-------------------

After setup, there are two ways to open the app:

  Option 1: Double-click the "Waqar Brothers" shortcut on your Desktop.

  Option 2: Double-click "start.bat" in the C:\WaqarBrothers folder.

The app will open in your browser at: http://localhost:8000

Note: The app also starts automatically when you turn on your laptop.


HOW TO LOG IN
-------------

  Username:  admin
  Password:  admin123  (this is the default — you must change it)

The first time you log in, the app will ask you to set a new password.
Choose a password that is at least 8 characters long. Remember it!

If you enter the wrong password 5 times, the account will be locked
for 15 minutes. Just wait and try again.


HOW TO ADD A RECOVERY ENTRY
----------------------------

1. On the Daily Page, click the green [+ Add Recovery] button.
2. Fill in the Salesman Name (e.g., Khalid).
3. Enter the Amount in PKR (e.g., 150000).
4. Add any Notes if needed (optional).
5. Click [Save Entry].

The entry will appear in the Recovery list and the totals will update.
The same salesman can have multiple entries per day (morning + evening).


HOW TO ADD AN EXPENSE ENTRY
----------------------------

1. On the Daily Page, click the green [+ Add Expense] button.
2. Fill in the Description (e.g., Food / Tea, Salary, Bank Slip).
3. Enter the Amount in PKR.
4. Add any Notes if needed (optional).
5. Click [Save Entry].

The entry will appear in the Expenses list and the totals will update.


HOW TO GO TO A PREVIOUS DAY
----------------------------

On the Daily Page, use the navigation buttons at the top:

  [Yesterday]  — goes back one day
  [Tomorrow]   — goes forward one day

You can view any past day's entries this way.


HOW TO EDIT OR DELETE AN ENTRY
-------------------------------

Each entry has two buttons on the right side:

  [Edit]  — opens the entry so you can change the details
  [Del]   — removes the entry from the list (it is hidden, not erased)


WHAT TO DO IF THE APP DOESN'T OPEN
------------------------------------

1. First, restart your laptop and try again.

2. If it still doesn't open, double-click "start.bat" in the
   C:\WaqarBrothers folder. This starts the app manually.

3. Then open your browser (Chrome or Edge) and go to:
   http://localhost:8000

4. If you still have problems, check the log file for errors:
   C:\WaqarBrothers\logs\app.log


WHERE IS MY DATA SAVED?
------------------------

All your data is saved in one file:

  C:\WaqarBrothers\data\accounts.db

IMPORTANT: Never delete this file! It contains all your entries,
settings, and account information. If this file is deleted, all
your data will be lost.


SETTINGS
--------

Click "Settings" in the top menu to change:
  - Business Name (shown at the top of the daily page)
  - Opening Balance (starting cash when you first began using the app)
  - Your password


============================================================
  Version: 1.0 (Phase 1)
  Waqar & Brothers — Tapal Tea Wholesale Agency
============================================================
