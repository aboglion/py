#!/bin/bash

# This script is the Linux equivalent of a Windows bat file.

# Based on the value of $1, jump to the appropriate section
if [[ "$1" == "init" ]]; then goto init
elif [[ "$1" == "init_" ]]; then goto init_
elif [[ "$1" == "active" ]]; then goto active
elif [[ "$1" == "install" ]]; then goto install
elif [[ "$1" == "req" ]]; then goto req
elif [[ "$1" == "run" ]]; then goto run
elif [[ "$1" == "clean" ]]; then goto clean
elif [[ "$1" == "out" ]]; then goto out
else
  goto help
fi

:help
    clear
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
    echo ""
    echo "Usage: ./my_script.sh <command>"
    echo "* in Linux/Unix, enter this command :"
    echo "      alias py='./py.sh'"
    echo "      then Usage will be: my_script <command>"
    echo ""

:init_
    if [[ ! -d venv ]]; then
        python3 -m venv --no-site-packages venv
    fi
    if [[ -f requirements.txt ]]; then
        /usr/bin/python3 -m pip install -r requirements.txt
    fi
    clear

:init
    if [[ ! -d venv ]]; then
        python3 -m venv venv
    fi
    if [[ -f requirements.txt ]]; then
        /usr/bin/python3 -m pip install -r requirements.txt
    fi
    clear

:active
    source .venv/bin/activate

:install
    if [[ -f requirements.txt ]]; then
        /usr/bin/python3 -m pip install -r requirements.txt
    else
        echo File does not exist.
    fi

:req
    /usr/bin/python3 -m pip freeze > requirements.txt

:run
    if [[ -z "$2" ]]; then
        echo Please specify a Python script to run using 'script.sh run my_script'
        exit 1
    fi
    clear
    /usr/bin/python3 "$2".py

:clean
    deactivate
    if [[ -d venv ]]; then
        rm -rf .venv
    fi

:out
    /usr/bin/python3 -m pip freeze > requirements.txt
    if [[ -f requirements.txt ]]; then
        for file in requirements.txt; do
            if [[ -s "$file" ]]; then
                rm requirements.txt
            fi
        done
    fi

    deactivate

