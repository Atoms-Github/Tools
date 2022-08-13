import datetime
import webbrowser
import os
import subprocess
import time

reddit = "https://www.reddit.com/r/dailyprogrammer/wiki/challenges/"
spreadsheet = "https://docs.google.com/spreadsheets/d/1aexPbZMsa3SKDMD6JZX3xv6j7ieiaxKV62vwMNfvfwk/edit#gid=0"
daily = r"C:\_C_\08-22 - August\Daily"
def main():
    day = datetime.datetime.today().day
    subdir = daily + "\\" + "a" + str(day)
    webbrowser.open(reddit)

    webbrowser.open(spreadsheet)
    # Get current date of the month
    try:
        os.makedirs(subdir)
        subprocess.call(["cargo.exe", "init"], cwd=subdir)

    except FileExistsError:
        pass
    time.sleep(1)
    subprocess.call(["clion64.exe", '"' + subdir + '"'], cwd=subdir)
    # Use subprocess to run cargo.exe in the subdirectory


if __name__ == "__main__":
    main()
