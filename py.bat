@echo off
color a
set PYTHON=venv\Scripts\python.exe
set VENV_ACTIVATE=venv\Scripts\activate.bat

::start "cmd"

:: Based on the value of %1, jump to the appropriate section
if "%1"=="init" goto init
if "%1"=="active" goto active
if "%1"=="install" goto install
if "%1"=="req" goto req
if "%1"=="run" goto run
if "%1"=="clean" goto clean
if "%1"=="out" goto out

:: If %1 does not match any of the above, default to help
goto help

:help
    cls
    echo Available targets:
    echo.
    echo command            explanation
    echo ---------      ---------------------------
    echo. init    --^> Initialize the virtual environment and install dependencies.
    echo. active  --^> Instructions for manually activating the virtual environment.
    echo. install --^> Install dependencies from requirements.txt.
    echo. req     --^> Generate a list of dependencies into requirements.txt.
    echo. run-xxx --^> Run the code (replace xxx with the name of your Python script without .py).
    echo. clean   --^> Clean the virtual environment.
    echo. out     --^> Deactivate the virtual environment.
    echo. ---------      ---------------------------
    echo. use:  py ^<command^>
    echo.
    goto :eof

:: Preparing the virtual environment
:init
    if not exist venv (
        python -m venv venv
        ::%PYTHON% -m pip install --upgrade pip
    )
    if exist requirements.txt (
        %PYTHON% -m pip install -r requirements.txt
    )
    cls
    goto active

:: Operating the virtual environment
:active
    call %VENV_ACTIVATE%
    goto :eof

:: Installation of dependent files
:install
    if exist requirements.txt (
        %PYTHON% -m pip install -r requirements.txt
    ) else (
        echo File does not exist.
    )
    goto :eof

:: Creating a list of dependencies
:req
    %PYTHON% -m pip freeze > requirements.txt
    goto :eof

:: Running code
:run
    if "%~2"=="" (
        echo Please specify a Python script to run using 'script.bat run my_script'
        exit /b 1
    )
    cls
    %PYTHON% %~2.py
    goto :eof

:: Cleaning the virtual environment
:clean
    deactivate
    if exist venv (
        rmdir /s /q venv
    )
    goto :eof

:out
    %PYTHON% -m pip freeze > requirements.txt
    if exist requirements.txt (
        for %%A in (requirements.txt) do if %%~zA == 0 (
            del requirements.txt
        )
    )

    deactivate
    goto :eof
