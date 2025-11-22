Game-Bot Installer ZIP Contents
====================================
Files:
- gamebot_main.py       : Main GUI for Game-Bot
- full_checker.py       : Environment checker
- reset.py              : Reset locked GameBot if password attempts fail
- setup_gamebot.bat     : Setup batch script
- LICENSE               : Custom strict BSD 3-Clause Commercial License
- README.txt            : This file

Installation Instructions:
1. Install NSIS: https://nsis.sourceforge.io/Download
2. Place all files in the same folder.
3. Open NSIS and compile GameBotInstaller.nsi
   -> Produces Game-Bot-Installer.exe
4. Run Game-Bot-Installer.exe as Administrator.
   - Creates folder C:\bot\ with subfolders: Main, Log, Checker
   - Copies all files
   - Generates random installer password and shows it ONCE
   - Installer password stored in C:\bot\Main\installer_password.txt
5. Run setup_gamebot.bat to check packages and launch GameBot.

Password System:
- You have 3 attempts to enter the installer password.
- If all 3 attempts fail, the program creates RESET_REQUIRED.txt.
- You must run reset.py and enter the installer password to unlock.

Folder Structure:
C:\bot
├─ Main
├─ Log
├─ Checker
├─ installer_password.txt
├─ RESET_REQUIRED.txt (if locked)

Keep your installer password safe!
