import datetime
import webbrowser
import os
import subprocess
import time
import config

reddit = "https://leetcode.com/"

def main():
    day = datetime.datetime.today().day
    subdir = os.path.expandvars("%month%") + "\\Daily\\" + "a" + str(day)
    webbrowser.open(reddit)

    webbrowser.open(spreadsheet)
    try:
        os.makedirs(subdir)
        subprocess.call(["cargo.exe", "init"], cwd=subdir)

    except FileExistsError:
        pass
    time.sleep(1)
    subprocess.call(["clion.cmd", '"' + subdir + '"'], cwd=subdir)


if __name__ == "__main__":
    main()
