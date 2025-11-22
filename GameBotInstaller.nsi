; GameBotInstaller.nsi
RequestExecutionLevel admin
Name "Game-Bot Installer"
OutFile "Game-Bot-Installer.exe"
InstallDir "C:\bot"
ShowInstDetails show
Section "Install"
    SetOutPath "$INSTDIR"
    CreateDirectory "$INSTDIR\Main"
    CreateDirectory "$INSTDIR\Log"
    CreateDirectory "$INSTDIR\Checker"
    SetOutPath "$INSTDIR"
    File "gamebot_main.py"
    File "setup_gamebot.bat"
    File "full_checker.py"
    StrCpy $0 "$INSTDIR\Log\setup_log.txt"
    FileOpen $1 "$0" w
    FileWrite $1 "Game-Bot installer ran successfully.`r`n"
    FileWrite $1 "Installed files:`r`n"
    FileWrite $1 " - gamebot_main.py`r`n"
    FileWrite $1 " - setup_gamebot.bat`r`n"
    FileWrite $1 " - full_checker.py`r`n"
    FileClose $1
    MessageBox MB_YESNO "Run initial setup now?" IDYES RunSetup IDNO SkipRun
    RunSetup:
        ExecWait '"$INSTDIR\setup_gamebot.bat"'
    SkipRun:
SectionEnd
Section "Uninstall"
    RMDir /r "$INSTDIR"
SectionEnd
