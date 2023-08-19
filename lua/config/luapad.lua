local luapad=require'luapad'
luapad.setup{
    context={
        getns=function (buf)
            local ns=vim.api.nvim_create_namespace('luapad_scratch_namespace')
            vim.api.nvim_buf_clear_namespace(buf,ns,0,-1)
            return ns
        end,
        getbuf=function ()
            return vim.fn.bufnr('#')
        end,
        lines=function (buf)
            local i=0
            local lines=vim.api.nvim_buf_line_count(buf)
            return function ()
                if i>=lines then return end
                i=i+1
                return i-1,vim.api.nvim_buf_get_lines(buf,i-1,-1,false)[1]
            end
        end,
        wrapp_high=function (buf,ns)
            return function (linenr,start,end_)
                vim.highlight.range(buf,ns,'Search',{linenr,start},{linenr,end_ or start+1})
            end
        end
    },
    on_init=function ()
        local buf=vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_lines(buf,0,-1,false,{
            '---@diagnostic disable: undefined-global,unused-local',
            'local buf=getbuf()',
            'local ns=getns(buf)',
            'local high=wrapp_high(buf,ns)',
            'for i,l in lines(buf) do',
            '    high(i,1)',
            'end',
        })
        vim.cmd.norm{'G',bang=true}
    end,
}
