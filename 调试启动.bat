@echo off
setlocal
title Window Switcher - Debug
cd /d "%~dp0"

echo ==============================================
echo  Window Switcher - Debug Mode
echo ==============================================
echo.
echo  This window will show Python errors.
echo  Press Ctrl+C to exit.
echo ==============================================
echo.

where python >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found in PATH
    pause
    exit /b 1
)

for /f "delims=" %%i in ('where python 2^>nul') do set "PY=%%i"
echo [OK] Python: %PY%
echo.

"%PY%" "%~dp0window_switcher.pyw"

echo.
echo Script exited. Press any key to close...
pause
