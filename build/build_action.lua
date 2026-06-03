--- NEW ACTIONS
newaction {
    trigger = 'export-meta',
    description = 'Export project metadata',
    execute = function ()
        local file = io.open( 'build/meta.json', 'w' )
        local indent = function ( level ) return string.rep( '\t', level ) end
        local get_exe_ext = function ( ) return os.host( ) == "windows" and ".exe" or ""  end
        local exe_ext = get_exe_ext( )
        local ws = workspace( )

        file:write( '{\n' )
        file:write( indent(1) .. '"generated_by" : "premake5 export-metadata",\n' )
        file:write( indent(1) .. '"generated_at" : "' .. os.date( "!%Y-%m-%dT%H:%M:%SZ" ) .. '",\n' )
        file:write( indent(1) .. '"platform" : "' .. os.host( ) .. '",\n' )
        file:write( indent(1) .. '"workspace" : "' ..  ws.name .. '",\n' )
        file:write( indent(1) .. '"configurations" : [ "Debug", "Release", "Dist" ],\n' )
        file:write( indent(1) .. '"targets" : [\n' )

        local project_list = { }
       
        for i, prj in ipairs( ws.projects ) do
            if prj.kind == "ConsoleApp" or prj.kind == "WindowedApp" then
                table.insert( project_list, prj )
            end
        end

        for i, prj in ipairs( project_list ) do
            file:write( indent(2) .. '{\n' )
            file:write( indent(3) .. '"name" : "' .. prj.name .. '",\n' )
            file:write( indent(3) .. '"kind" : "' .. prj.kind .. '",\n' )
            file:write( indent(3) .. '"target" : {\n' )
            file:write( indent(4) .. '"dir" : "' .. (prj.targetdir or "") .. '",\n' )
            file:write( indent(4) .. '"name" : "' .. (prj.targetname or prj.name) .. '",\n' )
            file:write( indent(4) .. '"path" : "' .. (prj.targetdir or "") .. "/" .. (prj.targetname or prj.name) .. exe_ext .. '"\n' )
            file:write( indent(3) .. '}\n' )
            file:write( indent(2) .. '}' )
            
            if i < #project_list then 
                file:write( ',' )
            end

            file:write( '\n' )
        end

        file:write( indent(1) .. ']\n' )
        file:write( '}\n' )
        file:close( )
    end
}
