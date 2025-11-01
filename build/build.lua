--- INCLUDES
include 'build_dependencies.lua'

--- WORKSPACE
workspace '...'
	platforms { 'x64' }
	defaultplatform 'x64'
	configurations { 'Debug', 'Release', 'Dist' }
	language 'C++'
	cppdialect 'C++20'
	targetdir '%{OutputDirs.bin}%{cfg.buildcfg}/'
	debugdir '%{OutputDirs.bin}%{cfg.buildcfg}/'
	location '../'
	startproject '...'

	--- WINDOWS GLOBALS
	filter 'system:windows'
		flags 'MultiProcessorCompile'
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
	filter 'configurations:Release'
		runtime 'Release'
		symbols 'On'
		optimize 'On'
		defines { 'RELEASE' }
	filter 'configurations:Dist'
		runtime 'Release'
		symbols 'Off'
		optimize 'On'
		defines { 'DIST' }

	group '...'
		include '...'

	group ''

