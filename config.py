import toml
import os


file_name = "config.toml"
def get(name):
    gen()
    with open(file_name, "r") as toml_file:
        data = toml.load(toml_file)
    return data[name]

def gen():
    if os.path.isfile(file_name):
        return
    di = {
        "month": "C:\\__E__\\2022\\August",
        "os": {
            "os": "win 10",
            "Arch": "x64"
        },
    }

    with open(file_name, "w") as toml_file:
        toml.dump(di, toml_file)

if __name__ == "__main__":
    gen()