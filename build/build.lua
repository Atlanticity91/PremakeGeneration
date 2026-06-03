--- INCLUDES
include 'build_dependencies.lua'
include 'build_action.lua'
include 'build_extensions.lua'

--- WORKSPACE
workspace '...'
	platforms { 'x64' }
	defaultplatform 'x64'
	configurations { 'Debug', 'Release', 'Dist' }
	language 'C++'
	cppdialect 'C++20'
	location '../'
	startproject '...'

	--- WINDOWS GLOBALS
	filter 'system:windows'
		multiprocessorcompile "On"
		buildoptions { '/EHsc', '/Zc:preprocessor', '/Zc:__cplusplus' }
		defines { 'WINDOWS' }

	--- LINUX GLOBALS
	filter 'system:linux'
		systemversion 'latest'
		defines { 'LINUX' }

	--- CONFIGURATIONS
	filter 'configurations:Debug'
		runtime 'Debug'
		symbols 'On'
		optimize 'Off'
		defines { 'DEBUG' }
		targetdir '%{OutputDirs.bin}Debug/'
		debugdir '%{OutputDirs.bin}Debug/'
		objdir '%{OutputDirs.bin_int}%{prj.name}-Debug'

	filter 'configurations:Release'
		runtime 'Release'
		symbols 'On'
		optimize 'On'
		defines { 'RELEASE' }
		targetdir '%{OutputDirs.bin}Release/'
		debugdir '%{OutputDirs.bin}Release/'
		objdir '%{OutputDirs.bin_int}%{prj.name}-Release'

	filter 'configurations:Dist'
		runtime 'Release'
		symbols 'Off'
		optimize 'On'
		defines { 'DIST' }
		targetdir '%{OutputDirs.bin}Dist/'
		debugdir '%{OutputDirs.bin}Dist/'
		objdir '%{OutputDirs.bin_int}%{prj.name}-Dist'

	files 'build/.editorconfig'

	group '...'
		include '...'

	group ''

