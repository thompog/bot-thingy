import os
import sys
import random
from tkinter import Tk, Label, Button, Entry, messagebox

LOCK_FILE = "C:\\bot\\Main\\RESET_REQUIRED.txt"
PASSWORD_FILE = "C:\\bot\\Main\\installer_password.txt"

MAX_ATTEMPTS = 3

class GameBotGUI:
    def __init__(self):
        self.root = Tk()
        self.root.title("Game-Bot Main GUI")
        self.root.geometry("400x300")
        self.attempts = 0

        if os.path.exists(LOCK_FILE):
            self.show_locked_screen()
        else:
            self.show_password_screen()

        self.root.mainloop()

    def show_locked_screen(self):
        Label(self.root, text="GameBot is locked!", fg="red", font=("Arial", 14)).pack(pady=20)
        Button(self.root, text="Run Reset Script", command=self.run_reset).pack(pady=10)
        Button(self.root, text="Exit", command=self.root.destroy).pack(pady=10)

    def run_reset(self):
        messagebox.showinfo("Info", "Please run 'reset.py' to reset the lock.")

    def show_password_screen(self):
        Label(self.root, text="Enter Installer Password:", font=("Arial", 12)).pack(pady=20)
        self.pw_entry = Entry(self.root, show="*")
        self.pw_entry.pack(pady=10)
        Button(self.root, text="Submit", command=self.check_password).pack(pady=10)

    def check_password(self):
        entered_pw = self.pw_entry.get()
        if not os.path.exists(PASSWORD_FILE):
            messagebox.showerror("Error", "Installer password file missing!")
            self.root.destroy()
            return

        with open(PASSWORD_FILE, "r") as f:
            correct_pw = f.read().strip()

        if entered_pw == correct_pw:
            self.show_main_menu()
        else:
            self.attempts += 1
            remaining = MAX_ATTEMPTS - self.attempts
            if remaining <= 0:
                self.lock_program()
            else:
                messagebox.showwarning("Incorrect", f"Wrong password! {remaining} attempts left.")

    def lock_program(self):
        with open(LOCK_FILE, "w") as f:
            f.write("Locked due to 3 incorrect password attempts.")
        messagebox.showerror("Locked", "Maximum attempts reached! Program locked. Run reset.py to unlock.")
        self.root.destroy()

    def show_main_menu(self):
        for widget in self.root.winfo_children():
            widget.destroy()

        Label(self.root, text="Welcome to Game-Bot", font=("Arial", 16)).pack(pady=20)
        Button(self.root, text="Start Training", width=20, command=self.start_training).pack(pady=5)
        Button(self.root, text="View Log", width=20, command=self.view_log).pack(pady=5)
        Button(self.root, text="Bot POV", width=20, command=self.bot_pov).pack(pady=5)
        Button(self.root, text="Exit", width=20, command=self.root.destroy).pack(pady=5)

    def start_training(self):
        messagebox.showinfo("Training", "Training started! (placeholder)")

    def view_log(self):
        log_path = "C:\\bot\\Log\\setup_log.txt"
        if os.path.exists(log_path):
            os.startfile(log_path)
        else:
            messagebox.showinfo("Log", "Log file not found.")

    def bot_pov(self):
        messagebox.showinfo("Bot POV", "Bot POV feature not implemented yet.")

if __name__ == "__main__":
    GameBotGUI()
