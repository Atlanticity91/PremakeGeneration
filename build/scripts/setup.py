#!/usr/bin/env python3

# --- INCLUDES
import os
import platform
import subprocess
import shutil
import sys
from pathlib import Path

# --- FUNCTIONS
'''
	clear_paths method
	@note : Delete output folders and solution files to regenerated clean solution.
'''
def clear_paths( ) :
	print( '\n> Clearing output folders :' )

	for path in os.listdir( '.' ) :
		path_ext = os.path.splitext( path )[ -1 ]

		if path in [ 'bin', 'bin-int', 'solution' ] :
			print( f'\033[33m> Deleted Folder : {path}\033[0m' )

			shutil.rmtree( path )
		elif path_ext.lower( ) in [ '.sln', '.vcxproj', '.filters', '.user' ] :
			print( f'\033[33m> Deleted File : {path}\033[0m' )

			os.remove( path )

'''
	call_premake method
	@note : Call premake5 for solution file generation.
'''
def call_premake( ) :
	premake_path = Path( 'build' ) / 'premake' / 'premake5'
	build_path = Path( 'build' ) / 'build.lua'
	
	if platform.system( ) == 'Windows' :
		premake_call = [ str( premake_path.with_suffix( '.exe' ) ) ]
	else :
		premake_call = [ str( premake_path ) ]

	premake_call.append( f'--file={str( build_path )}' )
	premake_call.extend( sys.argv[1:] )
	
	print( f'\n> Calling Premake5 : {premake_call[1:]}' )
	subprocess.call( premake_call )

# --- MAIN LOGIC
if __name__ == "__main__" :
	print( '=== setup project ===' )

	clear_paths( )
	call_premake( )

