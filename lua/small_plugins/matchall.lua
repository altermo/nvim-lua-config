local M={}
M.save=nil
function M.clear_word()
    vim.fn.matchdelete(M.save.matchid,M.save.window)
end
function M.clear_lsp()
    vim.api.nvim_win_call(M.save.window,vim.lsp.buf.clear_references)
end
function M.clear()
    if not M.save then return end
    pcall(M.clear_word)
    pcall(M.clear_lsp)
    vim.cmd.redraw()
    M.save=nil
end
function M.highlight_word()
    local word=vim.fn.expand('<cword>') --[[@as string]]
    local match=vim.fn.matchadd('Underline','\\M\\<'..vim.fn.escape(word,'\\')..'\\>',-1)
    M.save.matchid=match
end
function M.highlight_lsp()
    local clients=vim.iter(vim.lsp.get_clients()):map(function (lsp) return lsp.name end)
    if not vim.tbl_contains(clients,'jsonls') then
        vim.lsp.buf.document_highlight()
    end
end
function M.check_on_word()
    local col=vim.fn.col('.') --[[@as number]]
    local line=vim.api.nvim_get_current_line()
    return vim.regex('\\k'):match_str(line:sub(col,col))
end
function M.set_save()
    local col=vim.fn.col('.') --[[@as number]]
    local line=vim.api.nvim_get_current_line()
    M.save={window=vim.api.nvim_get_current_win()}
    M.save.fin=(vim.regex('[^[:keyword:]]'):match_str(line:sub(col)) or #line-col)+col-1
    M.save.beg=col-(vim.regex('[^[:keyword:]]'):match_str(line:sub(1,col):reverse()) or col)+1
    M.save.linenr=vim.fn.line('.')
end
function M.is_still_on_word()
    if not M.save then return end
    local col=vim.fn.col('.')
    local linenr=vim.fn.line('.')
    return col>=M.save.beg and col<=M.save.fin and linenr==M.save.linenr
end
function M.highlight()
    if M.is_still_on_word() then return end
    M.clear()
    if not M.check_on_word() then return end
    M.set_save()
    M.highlight_lsp()
    M.highlight_word()
end
function M.redraw()
    M.clear()
    M.highlight()
end
function M.setup()
    vim.api.nvim_create_augroup('matchall',{})
    vim.api.nvim_create_autocmd({'InsertEnter','TermEnter','WinLeave','CmdlineEnter'},{group='matchall',callback=M.clear})
    vim.api.nvim_create_autocmd({'CursorMoved'},{group='matchall',callback=M.highlight})
    vim.api.nvim_create_autocmd({'TextChanged','CmdLineLeave'},{group='matchall',callback=M.redraw})
    M.highlight()
end
return M
