@echo off

pushd %~dp0
python3 build/scripts/setup.py vs2022
popd

pause
