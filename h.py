import datetime
import webbrowser
import os
import subprocess
import time
import config

reddit = "https://leetcode.com/"
spreadsheet = "https://docs.google.com/spreadsheets/d/1Vex9NSi8At0jsg8TS6RUjX4n2t7IYbthlSXd7y_g8MY/edit#gid=0"

def main():
    day = datetime.datetime.today().day
<<<<<<< HEAD
    subdir = month + "\\Daily\\" + "a" + str(day)
    # Get current date of the month
=======
    subdir = os.path.expandvars("%month%") + "\\Daily\\" + "a" + str(day)
    webbrowser.open(reddit)

    webbrowser.open(spreadsheet)
>>>>>>> 78a0b21d14588a98c79da76e5eb0eb597a34e9ec
    try:
        os.makedirs(subdir)
        subprocess.call(["cargo.exe", "init"], cwd=subdir)

    except FileExistsError:
        pass
    time.sleep(1)
<<<<<<< HEAD
    clion = config.get("clion")
    subprocess.call([clion, '"' + subdir + '"'], cwd=subdir)
    # Use subprocess to run cargo.exe in the subdirectory
=======
    subprocess.call(["clion.cmd", '"' + subdir + '"'], cwd=subdir)
>>>>>>> 78a0b21d14588a98c79da76e5eb0eb597a34e9ec

    webbrowser.open(reddit)
    webbrowser.open(spreadsheet)

if __name__ == "__main__":
    main()
