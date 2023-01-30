local M={}
local gconf=require'ua.config'.conf
local conf=gconf.fastwarp
local mem=require'ua.memory'
local utils=require'ua.utils.utils'
local info_line=require'ua.utils.info_line'
function M.fastwarp()
  local line=utils.getline()
  local col=utils.getcol()
  local prev_char=line:sub(col-1,col-1)
  local next_char=line:sub(col,col)
  local next_2_char=line:sub(col+1,col+1)
  local prev_pair=mem.mem[prev_char]
  local next_pair=mem.mem[next_char]
  local next_2_pair=mem.mem[next_2_char]
  if prev_pair and next_pair and next_2_pair and prev_pair.paire==next_char and prev_pair.type==1 then
    local matching_pair_pos
    if next_2_pair.type==3 then
      matching_pair_pos=info_line.findstringe(line,col+2,next_2_char)
    else
      matching_pair_pos=info_line.findepaire(line,col+2,next_2_char,next_2_pair.paire)
    end
    if matching_pair_pos then
      utils.setline(line:sub(1,col-1)..line:sub(col+1,matching_pair_pos)..next_char..line:sub(matching_pair_pos+1))
      utils.setcursor(line,matching_pair_pos)
    end
  elseif conf.hopword and prev_pair and next_pair and next_2_pair and prev_pair.paire==next_char and prev_pair.type==1 then
    --TODO
  end
  if conf.fallback then vim.api.nvim_feedkeys(conf.fallback) end
end
function M.setup()
  if conf.enable then
    vim.keymap.set('i',conf.map,M.fastwarp,conf.mapopt)
  end
end
return M
