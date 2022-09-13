import toml
import os


config_filename = "config.toml"
default_cfg_filename = "default_config.toml"
def get(name):
    gen()
    with open(config_filename, "r") as toml_file:
        data = toml.load(toml_file)
    return data[name]
def get_default_cfg():
    with open(default_cfg_filename, "r") as toml_file:
        data = toml.load(toml_file)
    return data

def gen():
    if os.path.isfile(config_filename):
        return
    di = get_default_cfg()

    with open(config_filename, "w") as toml_file:
        toml.dump(di, toml_file)

if __name__ == "__main__":
    gen()
