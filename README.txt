Game-Bot Installer ZIP Contents
====================================
Files:
- gamebot_main.py       : Main GUI for Game-Bot
- full_checker.py       : Environment checker
- reset.py              : Reset locked GameBot if password attempts fail
- setup_gamebot.bat     : Setup batch script
- README.txt            : This file
- prefix.png            : photo of what well happen hen run

License stuff:
![⚠️ Use at Your Own Risk](https://img.shields.io/badge/⚠️-Use_at_Your_Own_Risk-red?style=flat&logo=warning)  

# ⚠️ Bot-Thingy

**Disclaimer & License**

Bot-Thingy is provided **“AS IS”**. Use at your own risk.  
- The software interacts with third-party software (Counter-Strike 2).  
- Not affiliated with or endorsed by Valve.  
- Users are responsible for complying with all game/platform terms.  
- The author is **not liable** for bans, account suspension, data loss, or legal consequences.  

This project is licensed under the **Bot-Thingy Software License** (Danish primary, English translation included). See [LICENSE](./LICENSE) for full terms.

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
- If all 3 attempts fail, the program creates RESET_REQUIRED.txt. and will lock it self ontil reset.py is started

- You must start reset.py and enter the installer password to unlock. 

Folder Structure:
C:\bot
├─ Main
├─ Log
├─ Checker
├─ installer_password.txt
├─ RESET_REQUIRED.txt (if locked)

Keep your installer password safe!
