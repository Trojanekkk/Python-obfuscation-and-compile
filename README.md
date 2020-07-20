# Python-obfuscation-and-compile

Protect your Python code and distribute it as .exe file with easse. With this short and simply batch file, convert your .py to .c nad compile it to the binaries. 

## Usage

 1. Clone the repo.
 2. Prepare Your .py file as module (to be run as imported external module in the other file).
 3. Place run.bat file in the same directory with the single-file Python code.
   - Remove **_\_result__** directory, if You already ran the batch script before
 4. Execute **run.bat**
 5. Follow instructions from console
   - Modify **main.py** if needed (after running **main.py** Your script should run as completely normal)
 6. Distribute **dist** directory
   - Remember that You have to compile it for every platform individually
