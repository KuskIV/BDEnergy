import os.path
from pathlib import Path

BASE_PATH = "C:/Users/Mads Kusk/git/BDEnergy/article/tables/results/"


def write_to_path(save_path, file_name, content):
    p = f"{BASE_PATH}/{save_path}"
    Path(p).mkdir(parents=True, exist_ok=True)
    with open(os.path.join(p, file_name), "w") as file1:
        toFile = content
        file1.write(toFile)
