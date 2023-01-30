local M={}
function M.setup(config)
    local mconfig=require('ua.config')
    mconfig.setup(config or {})
    mconfig.setup_extensions()
    require('ua.memory').gen_filters()
    mconfig.create_mappings()
    require('ua.maps.bs').setup()
    require('ua.maps.cr').setup()
    require('ua.maps.sp').setup()
    require('ua.maps.fastwarp').setup()
end
return M
