# Waqar & Brothers - Database Setup Script
# Creates the SQLite database with all Phase 1 tables
# Run once during installation: python setup_db.py

import os
import sqlite3
from werkzeug.security import generate_password_hash

# Path to the database file
DB_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                       '..', 'data', 'accounts.db')


def setup_database():
    """Create all Phase 1 tables, indexes, and default data."""

    # Make sure the data folder exists
    os.makedirs(os.path.dirname(DB_PATH), exist_ok=True)

    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    # ---- Table 1: users ----
    # Stores the single owner login
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id                   INTEGER PRIMARY KEY AUTOINCREMENT,
            username             TEXT    NOT NULL UNIQUE,
            password             TEXT    NOT NULL,
            must_change_password INTEGER NOT NULL DEFAULT 1,
            failed_attempts      INTEGER NOT NULL DEFAULT 0,
            locked_until         TEXT    DEFAULT NULL
        )
    ''')

    # ---- Table 2: daily_entries ----
    # Stores every recovery and expense entry
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS daily_entries (
            id          INTEGER PRIMARY KEY AUTOINCREMENT,
            date        TEXT    NOT NULL,
            type        TEXT    NOT NULL,
            amount      INTEGER NOT NULL,
            description TEXT    NOT NULL,
            notes       TEXT    DEFAULT '',
            is_deleted  INTEGER NOT NULL DEFAULT 0,
            created_at  TEXT    NOT NULL
        )
    ''')

    # ---- Table 3: settings ----
    # Stores app configuration values (key-value pairs)
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS settings (
            key   TEXT PRIMARY KEY,
            value TEXT NOT NULL
        )
    ''')

    # ---- Migrate: add new columns if they don't exist ----
    # Check existing columns in daily_entries
    cursor.execute('PRAGMA table_info(daily_entries)')
    existing_columns = [row[1] for row in cursor.fetchall()]

    if 'payment_type' not in existing_columns:
        cursor.execute('''
            ALTER TABLE daily_entries ADD COLUMN payment_type TEXT DEFAULT 'cash'
        ''')
        print('Added column: payment_type')

    if 'receipt' not in existing_columns:
        cursor.execute('''
            ALTER TABLE daily_entries ADD COLUMN receipt TEXT
        ''')
        print('Added column: receipt')

    if 'category' not in existing_columns:
        cursor.execute('''
            ALTER TABLE daily_entries ADD COLUMN category TEXT DEFAULT 'other'
        ''')
        print('Added column: category')

    # ---- Indexes for fast queries ----
    cursor.execute('''
        CREATE INDEX IF NOT EXISTS idx_entries_date
        ON daily_entries(date, is_deleted)
    ''')
    cursor.execute('''
        CREATE INDEX IF NOT EXISTS idx_entries_type
        ON daily_entries(date, type, is_deleted)
    ''')

    # ---- Insert default admin user ----
    # Password "admin123" is hashed — never stored as plain text
    # must_change_password = 1 forces password change on first login
    cursor.execute('SELECT COUNT(*) FROM users WHERE username = ?', ('admin',))
    if cursor.fetchone()[0] == 0:
        hashed_password = generate_password_hash('admin123')
        cursor.execute('''
            INSERT INTO users (username, password, must_change_password,
                               failed_attempts, locked_until)
            VALUES (?, ?, 1, 0, NULL)
        ''', ('admin', hashed_password))
        print('Default admin user created (username: admin, password: admin123)')
        print('Password change will be required on first login.')

    # ---- Insert default settings ----
    default_settings = [
        ('business_name',   'Waqar & Brothers'),
        ('opening_balance', '0'),
        ('fy_start',        '2025-07-01'),
        ('fy_end',          '2026-06-30'),
    ]
    for key, value in default_settings:
        cursor.execute('INSERT OR IGNORE INTO settings (key, value) VALUES (?, ?)',
                       (key, value))

    conn.commit()
    conn.close()

    print(f'Database created successfully at: {os.path.abspath(DB_PATH)}')
    print('Tables: users, daily_entries, settings')
    print('Indexes: idx_entries_date, idx_entries_type')
    print('Default settings: business_name, opening_balance, fy_start, fy_end')


if __name__ == '__main__':
    setup_database()
