import subprocess
import sys

packages = ["tensorflow", "pynput", "numpy"]

def check_packages():
    for pkg in packages:
        try:
            __import__(pkg)
        except ImportError:
            print(f"{pkg} not found, installing...")
            subprocess.check_call([sys.executable, "-m", "pip", "install", pkg])
        else:
            print(f"{pkg} already installed.")

if __name__ == "__main__":
    print("Checking required packages...")
    check_packages()
    print("Environment check complete!")
