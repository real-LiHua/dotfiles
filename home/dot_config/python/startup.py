import sys, time
from typing import override

class __hook:
    @override
    def __str__(self) -> str:
        return time.strftime("%H:%M:%S\n>>> ", time.localtime())

sys.ps1=__hook()
