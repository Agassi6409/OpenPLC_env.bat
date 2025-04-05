@echo off
cd /d %~dp0
echo "Starting OpenPLC Editor..."

if exist .\new_editor\ (
  rmdir /s /q .\editor
  rmdir /s /q .\matiec\lib
  move .\new_editor .\editor
  move .\new_lib .\matiec\lib
)

if exist ".\python\.venv\" (
  ".\python\.venv\Scripts\python.exe" ".\editor\Beremiz.py"
) else (
  echo "Setting up python virtual environment..."
  ".\python\python.exe" -m venv ".\python\.venv"

  echo "Installing dependencies..."
  ".\python\.venv\Scripts\python.exe" -m pip install -r ".\python\requirements.txt"

  echo "Starting OpenPLC Editor..."
  ".\python\.venv\Scripts\python.exe" ".\editor\Beremiz.py"
)
pause
