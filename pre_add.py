# /usr/bin/python3
from os import getenv
from os.path import abspath
from pathlib import Path

print(getenv("CHEZMOI_WORKING_TREE"))
for path in getenv("CHEZMOI_ARGS", "").split()[2:]:
   print(abspath(Path(abspath(path)) / ".."))
