@ECHO off
ECHO [97;100m Welcome to "Protect Python code and expose as exe file" [0m

ECHO [97;100m Installing cython and pyinstaller [0m
REM pip install pyinstaller
REM pip install cython

ECHO [97;100m Set python module name you want to compile [0m
SET /p module_name="Type <module name.py>: "

IF NOT EXIST %module_name% (
    ECHO [101;93m File %module_name% does not exist in: %cd%! [0m
    PAUSE
    EXIT 1
)

IF EXIST __result__ (
    ECHO [101;93m Remove __result__ directory from: %cd%! [0m
    PAUSE
    EXIT 1
) ELSE MKDIR __result__

xcopy .\%module_name% .\__result__\

ECHO from setuptools import setup>>                 .\__result__.\compile.py
ECHO from Cython.Build import cythonize>>           .\__result__.\compile.py
ECHO setup(>>                                       .\__result__.\compile.py
ECHO     ext_modules=cythonize('%module_name%')>>   .\__result__.\compile.py
ECHO )>>                                            .\__result__.\compile.py

findstr import .\__result__\%module_name%>>         .\__result__.\main.py

REM python .\compile.py build_ext --inplace
REM pyinstaller .\main.py
PAUSE