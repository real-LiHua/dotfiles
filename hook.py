#!/usr/bin/python3
from filecmp import dircmp
from os import environ, getenv, getuid
from os.path import abspath
from pathlib import Path
from shutil import copytree, ignore_patterns
from subprocess import run


def has_diff(diff: dircmp) -> bool:
    if diff.left_only or diff.diff_files:
        return True
    for sub in diff.subdirs.values():
        if has_diff(sub):
            return True
    return False

def apply():
    source: Path = Path(getenv("CHEZMOI_WORKING_TREE")) / "root"
    target: str = "/"
    try:
        if not has_diff(dircmp(source, target)):
            return
    except RecursionError:
        pass
    if getuid():
        run(["sudo", "-E", "/usr/bin/python3", __file__])
        return
    ignore = ignore_patterns("*~")
    copytree(source, target, ignore=ignore, dirs_exist_ok=True)

match getenv("CHEZMOI_COMMAND"):
    case "update" | "apply":
        apply()
    case "init":
        args: list[str] = getenv("CHEZMOI_ARGS", "").split()
        if "-a" in args or "--apply" in args:
            apply()
    case "add":
        for path: str in getenv("CHEZMOI_ARGS", "").split()[2:]:
            print(abspath(Path(abspath(path)) / ".."))
            pass
    case _:
        print(environ)
