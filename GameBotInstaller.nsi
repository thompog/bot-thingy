;--------------------------------
; Game-Bot NSIS Installer Script
;--------------------------------

RequestExecutionLevel admin
Name "Game-Bot Installer"
OutFile "Game-Bot-Installer.exe"
InstallDir "C:\bot"
ShowInstDetails show

;--------------------------------
; Pages
;--------------------------------
Page license LicenseAccepted
Page directory
Page instfiles

;--------------------------------
; License Text
;--------------------------------
LicenseData LICENSE ; Uses your custom license file in the same folder

;--------------------------------
; Sections
;--------------------------------
Section "Install"

    ; Create folder structure
    CreateDirectory "$INSTDIR\Main"
    CreateDirectory "$INSTDIR\Log"
    CreateDirectory "$INSTDIR\Checker"

    ; Copy files
    SetOutPath "$INSTDIR"
    File "gamebot_main.py"
    File "setup_gamebot.bat"
    File "full_checker.py"

    ; Write a basic log
    StrCpy $0 "$INSTDIR\Log\setup_log.txt"
    FileOpen $1 "$0" w
    FileWrite $1 "Game-Bot installer ran successfully.`r`n"
    FileWrite $1 "Installed files:`r`n"
    FileWrite $1 " - gamebot_main.py`r`n"
    FileWrite $1 " - setup_gamebot.bat`r`n"
    FileWrite $1 " - full_checker.py`r`n"
    FileClose $1

    ; Ask to run initial setup
    MessageBox MB_YESNO "Run initial setup now?" IDYES RunSetup IDNO SkipRun

    RunSetup:
        ExecWait '"$INSTDIR\setup_gamebot.bat"'
    SkipRun:

SectionEnd

;--------------------------------
; Uninstall Section
;--------------------------------
Section "Uninstall"
    RMDir /r "$INSTDIR"
SectionEnd
