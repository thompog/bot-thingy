import os

LOCK_FILE = "C:\\bot\\Main\\RESET_REQUIRED.txt"
PASSWORD_FILE = "C:\\bot\\Main\\installer_password.txt"

if not os.path.exists(LOCK_FILE):
    print("No lock detected. Program is already usable.")
    exit()

if not os.path.exists(PASSWORD_FILE):
    print("Installer password file missing! Cannot reset.")
    exit()

with open(PASSWORD_FILE, "r") as f:
    correct_pw = f.read().strip()

entered_pw = input("Enter installer password to unlock GameBot: ")

if entered_pw == correct_pw:
    os.remove(LOCK_FILE)
    print("Lock reset successful! You can now run GameBot.")
else:
    print("Incorrect password. Reset aborted.")
