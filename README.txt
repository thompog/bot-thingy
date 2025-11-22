Game-Bot Installer ZIP Contents
====================================
Files:
- gamebot_main.py   : Main GUI for Game-Bot
- full_checker.py   : Ultra-safe environment checker
- setup_gamebot.bat : Setup batch script to run checker and main bot
- GameBotInstaller.nsi : NSIS installer script
- README.txt        : This file

Instructions:
1. Install NSIS: https://nsis.sourceforge.io/Download
2. Place all files in a single folder.
3. Open NSIS and compile GameBotInstaller.nsi
   -> Produces Game-Bot-Installer.exe
4. Run Game-Bot-Installer.exe as Administrator.
   - Creates C:\bot folder structure (Main, Log, Checker)
   - Copies all files
   - Optionally runs setup_gamebot.bat to check packages and launch bot
