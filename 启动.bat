@echo off
setlocal
cd /d "%~dp0"

set "PYTHON="

where python >nul 2>&1
if not errorlevel 1 (
    for /f "delims=" %%i in ('where python 2^>nul') do set "PYTHON=%%i"
)

if "%PYTHON%"=="" (
    echo ERROR: Python not found
    pause
    exit /b 1
)

echo [OK] Python: %PYTHON%

REM Write a VBS launcher and run it
set "VBS=%TEMP%\switcher_run.vbs"
> "%VBS%" echo CreateObject("WScript.Shell").Run """%PYTHON%"" ""%~dp0window_switcher.pyw""", 0, False
cscript //nologo "%VBS%"
del "%VBS%"

echo [OK] Done. Icon should be in system tray.
timeout /t 2 /nobreak >nul
