RequestExecutionLevel admin
Name "Game-Bot Installer"
OutFile "Game-Bot-Installer.exe"
InstallDir "C:\bot"
ShowInstDetails show

Page license LicenseAccepted
Page directory
Page instfiles

LicenseData LICENSE

Section "Install"

    ; Create folder structure
    CreateDirectory "$INSTDIR\Main"
    CreateDirectory "$INSTDIR\Log"
    CreateDirectory "$INSTDIR\Checker"

    ; Copy files
    SetOutPath "$INSTDIR"
    File "gamebot_main.py"
    File "full_checker.py"
    File "setup_gamebot.bat"
    File "reset.py"

    ; Get random digits 1-8
    ${DoWhile} $0 == ""
        ClearErrors
        IntFmt $R1 "%d" $RANDOM
        IntFmt $R2 "%d" $RANDOM
        IntFmt $R3 "%d" $RANDOM
        IntFmt $R4 "%d" $RANDOM
        IntFmt $R5 "%d" $RANDOM
        IntFmt $R6 "%d" $RANDOM
        IntFmt $R7 "%d" $RANDOM
        IntFmt $R8 "%d" $RANDOM
        StrCpy $0 "$R1$R2$R3-$R4$R5$R6-$R7$R8-BOT-åÆø"
    ${Loop}

    ; Get current time and date
    System::Call 'kernel32::GetLocalTime(*i,i,i,i,i,i,i,i,i)' ; Retrieves system time
    ; For simplicity, let's append YYYYMMDDHHMM as TAD
    ; Note: You can replace with more precise NSIS time formatting if needed
    ; For demonstration, we'll use placeholder TAD
    StrCpy $TAD "TAD" ; Placeholder, NSIS can use ${__DATE__} and ${__TIME__} macros if desired

    ; Combine password
    StrCpy $FINAL_PW "$0-$TAD"

    ; Write password to installer_password.txt
    SetOutPath "$INSTDIR\Main"
    FileOpen $1 "$INSTDIR\Main\installer_password.txt" w
    FileWrite $1 "$FINAL_PW"
    FileClose $1

    ; Show password ONCE to the user
    MessageBox MB_OK "Your installer password is:`r`n$FINAL_PW`r`nKeep it safe! It will only be shown once."

    ; Write a basic log
    StrCpy $0 "$INSTDIR\Log\setup_log.txt"
    FileOpen $1 "$0" w
    FileWrite $1 "Game-Bot installer ran successfully.`r`n"
    FileWrite $1 "Installed files:`r`n"
    FileWrite $1 " - gamebot_main.py`r`n"
    FileWrite $1 " - full_checker.py`r`n"
    FileWrite $1 " - setup_gamebot.bat`r`n"
    FileWrite $1 " - reset.py`r`n"
    FileWrite $1 "Installer password: $FINAL_PW`r`n"
    FileClose $1

SectionEnd
