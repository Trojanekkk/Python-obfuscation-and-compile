@ECHO off
ECHO [97;100m Welcome to "Protect Python code and expose as exe file" [0m
ECHO.
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

ECHO [97;100m Set name of python class or function you want to import to main [0m
SET /p export_name="Type <export logic name>: 

ECHO # Modify this file to be albe run Your appliaction from the file.>>    .\__result__.\main.py
findstr import .\__result__\%module_name%>>                                 .\__result__.\main.py
ECHO from %module_name% import %export_name%>>                              .\__result__.\main.py
ECHO if __name__ == "__main__":>>                                           .\__result__.\main.py
ECHO     app = %export_name%()>>                                            .\__result__.\main.py

ECHO [101;93m Modify .\__result__\main.py, to be able run application from main.py file and continue this script [0m
PAUSE

[97;100m Building app [0m
python .\__result__\compile.py build_ext --inplace
REM pyinstaller .\main.py
PAUSE