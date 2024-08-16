#!/usr/bin/python3
from os import environ, getenv, getuid
from os.path import abspath
from pathlib import Path
from shutil import copytree, ignore_patterns
from subprocess import run

def apply():
    if not getuid():
        run(["sudo", "-E", "/usr/bin/python3", __file__])
        return
    copytree(Path(getenv("CHEZMOI_WORKING_TREE")) / "root", "/", ignore=ignore_patterns("*~"), dirs_exist_ok=True)

match getenv("CHEZMOI_COMMAND"):
    case "update":
        apply()
    case "apply":
        apply()
    case "init":
        args: list = getenv("CHEZMOI_ARGS", "").split()
        if "-a" in args or "--apply" in args:
            apply()
    case "add":
        for path in getenv("CHEZMOI_ARGS", "").split()[2:]:
            print(abspath(Path(abspath(path)) / ".."))
            pass
    case _:
        print(environ)
