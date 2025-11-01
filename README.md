# PremakeGeneration
[Premake5](https://premake.github.io/) based solution generation.

This repo contains scripts to generate C++ solution on any platform and IDE by using [python3](https://www.python.org/) and [Premake5](https://premake.github.io/).

# Requirement
Replace `...` from `workspace` inside `build.lua` by the name of your workspace, startproject need to be set, also at the file end :
``` lua
group '...'
		include '...'
group ''
```
must be changed to include your solution structure and build files includes, for example :
``` lua
group 'Libs'
		include 'build_core.lua'
		include 'build_thirdparty.lua'
group 'Main'
    include 'build_main.lua'
group ''
```
Be aware that all modification should follow [Premake5](https://premake.github.io/) standard to be operated smoothly.

# Setup Solution
## Windows 
For Windows user the default `setup_windows.bat` file will generate the solution for [`Visual Studio`](https://visualstudio.microsoft.com/fr/)
So for running solution generation run :
```batch
./setup_windows.bat
```
## Linux
For Linux user the default `setup_linux.sh` file will generate the solution using [gmake](https://www.gnu.org/software/make/)
So for running solution generation run :
```bash
bash setup_linux.sh
```
