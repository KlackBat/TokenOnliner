@echo off

set "python_exe=python.exe"
set "reqs_file=reqs.txt"
set "main_file=main.py"

%python_exe% --version >nul 2>&1
if errorlevel 1 (
    echo Python is not installed.
    exit /b
)

for /f %%i in (%reqs_file%) do (
    %python_exe% -c "import %%i" >nul 2>&1
    if errorlevel 1 (
        echo Installing required module %%i...
        %python_exe% -m pip install %%i
        if errorlevel 1 (
            echo Failed to install module %%i. Exiting.
            exit /b
        )
    )
)

%python_exe% %main_file%
