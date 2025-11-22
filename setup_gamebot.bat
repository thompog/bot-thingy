@echo off
title Game-Bot Setup
set LOGFILE=C:\bot\Log\setup_log.txt
echo Starting Game-Bot setup... > "%LOGFILE%"
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python not found. Aborting setup. >> "%LOGFILE%"
    pause
    exit /b 1
)
python -m pip --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    python -m ensurepip --default-pip >> "%LOGFILE%" 2>&1
)
python -m pip install --upgrade pip >> "%LOGFILE%" 2>&1
python "%~dp0full_checker.py" >> "%LOGFILE%" 2>&1
python "%~dp0gamebot_main.py" >> "%LOGFILE%" 2>&1
exit /b 0
