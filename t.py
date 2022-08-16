import os
import config

if __name__ == "__main__":
    month = config.get("month")
    os.chdir(month)
    os.system(f"cmd.exe")
