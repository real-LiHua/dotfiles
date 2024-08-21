#!/usr/bin/python3
from filecmp import dircmp
from os import environ, getenv, getuid
from os.path import abspath
from pathlib import Path
from shutil import copy2, copytree, ignore_patterns
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
    if getuid():
        try:
            if not has_diff(dircmp(source, target)):
                return
        except RecursionError:
            pass
        run(["sudo", "-E", "/usr/bin/python3", __file__])
    else:
        copytree(source, target, ignore=ignore_patterns("*~"), dirs_exist_ok=True)


match getenv("CHEZMOI_COMMAND"):
    case "update" | "apply":
        apply()
    case "init":
        args: list[str] = getenv("CHEZMOI_ARGS", "").split()
        if "-a" in args or "--apply" in args:
            apply()
    case "add":
        command_dir: Path = Path(getenv("CHEZMOI_COMMAND_DIR"))
        working_tree: Path = Path(getenv("CHEZMOI_WORKING_TREE")) / "root"
        for path in getenv("CHEZMOI_ARGS", "").split()[2:]:
            if path.startswith("/"):
                source: Path = Path(path)
            else:
                source: Path = command_dir / Path(path)
            target: Path = working_tree / abspath(source)[1:]
            Path(abspath(target / "..")).mkdir(exist_ok=True)
            copy2(Path(source), target)
    case _:
        print(environ)
