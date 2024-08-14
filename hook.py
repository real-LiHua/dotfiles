# /usr/bin/python3
from os import environ
from os import getenv
from os.path import abspath
from pathlib import Path

match getenv("CHEZMOI_COMMAND"):
    case "apply":
        print(Path(getenv("CHEZMOI_WORKING_TREE")) / "root")
    case "add":
        pass
    case _:
        print(environ)
#for path in getenv("CHEZMOI_ARGS", "").split()[2:]:
#   print(abspath(Path(abspath(path)) / ".."))
