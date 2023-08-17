@echo off

:: Check if the script is running with administrative privileges
>nul 2>&1 "%SYSTEMROOT%\System32\cacls.exe" "%SYSTEMROOT%\System32\config\system"

:: If the error level is 0, the script is running as admin
if '%errorlevel%' NEQ '0' (
    echo Please run as an Administrator.
    echo Press any key to exit...
    pause >nul
    exit /b
)

rem Change working directory to the batch file's folder
cd /d "%~dp0"

echo Checking Organization Execution Policy...
powershell.exe -NoProfile -ExecutionPolicy RemoteSigned -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
echo Execution policy changed to RemoteSigned for CurrentUser.

echo Installing MSCOMM32.OCX ...
powershell.exe .\PSMSCOMM32.ps1

echo Press any key to exit...
pause >nul

