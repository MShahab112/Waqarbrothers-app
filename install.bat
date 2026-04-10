@echo off
REM ============================================================
REM  Waqar & Brothers - Daily Account Book
REM  One-Time Installation Script
REM  Double-click this file to set up the app.
REM ============================================================

echo.
echo ============================================================
echo   Waqar ^& Brothers - Daily Account Book
echo   Installation Script
echo ============================================================
echo.

REM --- Step 1: Check if Python is installed ---
echo Checking for Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo ERROR: Python 3.11 is not installed.
    echo Please download it from: https://www.python.org/downloads
    echo IMPORTANT: During install, tick the box that says "Add Python to PATH".
    echo After installing Python, double-click install.bat again.
    echo.
    pause
    exit /b 1
)

REM Check that it is Python 3.x
python -c "import sys; exit(0 if sys.version_info[0]==3 else 1)" >nul 2>&1
if errorlevel 1 (
    echo.
    echo ERROR: Python 3 is required but a different version was found.
    echo Please download Python 3.11 from: https://www.python.org/downloads
    echo IMPORTANT: During install, tick the box that says "Add Python to PATH".
    echo After installing Python, double-click install.bat again.
    echo.
    pause
    exit /b 1
)

echo Python found.
echo.

REM --- Step 2: Install Flask ---
echo Installing Flask...
pip install flask >nul 2>&1
if errorlevel 1 (
    echo ERROR: Failed to install Flask. Check your internet connection.
    pause
    exit /b 1
)
echo Flask installed.
echo.

REM --- Step 3: Create folders if they don't exist ---
if not exist "C:\WaqarBrothers\data" mkdir "C:\WaqarBrothers\data"
if not exist "C:\WaqarBrothers\logs" mkdir "C:\WaqarBrothers\logs"

REM --- Step 4: Generate SECRET_KEY and save to config.py ---
echo Generating secret key...
python -c "import os; key = os.urandom(24).hex(); f = open(r'C:\WaqarBrothers\app\config.py', 'w'); f.write('SECRET_KEY = \"' + key + '\"\n'); f.close(); print('Secret key saved to config.py')"
echo.

REM --- Step 5: Create the database ---
echo Setting up the database...
cd /d "C:\WaqarBrothers\app"
python setup_db.py
if errorlevel 1 (
    echo ERROR: Database setup failed.
    pause
    exit /b 1
)
echo.

REM --- Step 6: Create desktop shortcut ---
echo Creating desktop shortcut...
(
    echo [InternetShortcut]
    echo URL=http://localhost:8000
    echo IconIndex=0
) > "%USERPROFILE%\Desktop\Waqar Brothers.url"
echo Desktop shortcut created.
echo.

REM --- Step 7: Register auto-start with Task Scheduler ---
echo Setting up auto-start...
schtasks /create /tn "WaqarBrothersApp" /tr "C:\WaqarBrothers\start.bat" /sc onlogon /rl highest /f >nul 2>&1
if errorlevel 1 (
    echo WARNING: Could not set up auto-start. You may need to run this as Administrator.
    echo You can still start the app manually by double-clicking start.bat.
) else (
    echo Auto-start registered. The app will start when you log in to Windows.
)
echo.

REM --- Done ---
echo ============================================================
echo   Setup complete!
echo.
echo   To open the app:
echo     - Double-click the "Waqar Brothers" shortcut on your Desktop
echo     - Or double-click start.bat in C:\WaqarBrothers\
echo.
echo   Default login:
echo     Username: admin
echo     Password: admin123
echo     (You will be asked to change the password on first login)
echo ============================================================
echo.
pause
