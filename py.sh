#!/bin/bash

PYTHON="venv/bin/python3"
pip="venv/bin/pip3"
VENV_ACTIVATE="venv/bin/activate"

help() {
  clear
  echo "Available targets:"
  echo "  "
  echo "command            explanation"
  echo "---------      ---------------------------"
  echo "init    --> Initialize the virtual environment and install dependencies."
  echo "active  --> Instructions for manually activating the virtual environment."
  echo "install --> Install dependencies from requirements.txt."
  echo "req     --> Generate a list of dependencies into requirements.txt."
  echo "run-xxx --> Run the code (replace xxx with the name of your Python script without .py)."
  echo "clean   --> Clean the virtual environment."
  echo "exit    --> Deactivate the virtual environment."
  echo "---------      ---------------------------"
  echo ""
  echo "Usage: ./my_script.sh <command>"
  echo "* in Linux/Unix, enter this command :"
  echo "      alias py='./py.sh'"
  echo "      then Usage will be: my_script <command>"
  echo ""
}

init() {
  if [ ! -d "venv" ]; then
    python3 -m venv venv
  fi
  $PYTHON -m pip install --upgrade pip
  $PYTHON -m pip install -r requirements.txt
  clear
  source $VENV_ACTIVATE
}

active() {
  if [ -d "venv" ]; then
    source $VENV_ACTIVATE
    echo "Virtual environment activated. You can now use the environment for Python development."
  else
    echo "Virtual environment not found. Please run 'init' to create and activate the environment."
  fi
}


install() {
  if [ -e "requirements.txt" ]; then
    $PYTHON -m pip install -r requirements.txt
  else
    echo "File does not exist."
  fi
}

req() {
  $PYTHON -m pip freeze > requirements.txt
}

run() {
  if [ -z "$(echo $1 | grep '^run-')" ]; then
    echo "Please specify a Python script to run using './my_script.sh run my_script'"
    exit 1
  fi
  clear
  $PYTHON "$(echo $1 | sed 's/^run-//').py"
}

clean() {
  rm -rf venv
}

out() {
  $PYTHON -m pip freeze > requirements.txt
  clear
  deactivate
}

# Check for the number of arguments
if [ $# -eq 0 ]; then
  help
else
  case $1 in
    "help") help ;;
    "init") init ;;
    "active") active ;;
    "install") install ;;
    "req") req ;;
    "run") run "${@:2}" ;;
    "clean") clean ;;
    "out") out ;;
    *) echo "Invalid command. Use './my_script.sh help' for usage information." ;;
  esac
fi
