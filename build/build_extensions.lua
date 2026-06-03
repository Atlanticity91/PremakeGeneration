--- Extensions
--[[
    precompiledheaders method
    @param config Target configuration :
                - header Set precompiled header file (must be directly accessible from includedirs).
                - source absolute path to source file used by msvc only.
]]--
function precompiledheaders( config )
    assert( config.header, 'precompiledheaders() : header argument is required' )
    assert( config.source, 'precompiledheaders() : source argument is required' )

    enablepch 'On'
    pchheader( config.header )

    filter 'action:vs*'
		pchsource( config.source )
end
