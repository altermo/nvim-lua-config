local M={}
local gconf=require'ua.config'.conf
local conf=gconf.bs or {}
local mem=require'ua.memory'
local utils=require'ua.utils.utils'
local info_line=require'ua.utils.info_line'
local open_pair=require'ua.utils.open_pair'
function M.backspace()
  local line=utils.getline()
  local col=utils.getcol()
  local prev_char=line:sub(col-1,col-1)
  local next_char=line:sub(col,col)
  local prev_pair=mem.mem[prev_char]
  local next_pair=mem.mem[next_char]
  if prev_pair and next_pair and prev_pair.paire==next_char and prev_pair.type==1 then
    if prev_pair.type==3 then
      if not open_pair.open_pair_ambigous(prev_char,line) then
        utils.delete(line,col,1,1)
        return
      end
    elseif not open_pair.open_pair_before(prev_char,next_char,line,col) then
      utils.delete(line,col,1,1)
      return
    end
  elseif conf.overjump and prev_pair and prev_pair.type==1 then
    if not open_pair.open_pair_before(prev_char,prev_pair.paire,line,col) then
      local pospos=info_line.findepaire(line,col,prev_char,prev_pair.paire)
      if pospos then
        utils.setline(line:sub(1,col-2)..line:sub(col,pospos-1)..line:sub(pospos+1))
        utils.moveh()
        return
      end
    end
  elseif prev_pair then
    local prev_2_pair=line:sub(col-2,col-2)
    local otherpair=mem.mem[prev_2_pair]
    if otherpair and otherpair.paire==prev_char then
      if prev_pair.type==3 then
        if not open_pair.open_pair_ambigous(prev_char,line) then
          utils.delete(line,col,2)
          return
        end
      elseif otherpair and not open_pair.open_paire_after(prev_2_pair,prev_char,line,col) then
        if otherpair and otherpair.paire==prev_char then
          utils.delete(line,col,2)
          return
        end
      end
    end
  elseif conf.space and prev_char==' ' then
    local otherchar
    for i=col-2,1,-1 do
      otherchar=line:sub(i,i)
      if otherchar~=' ' then
        col=i+2
        break
      end
    end
    local otherpair=mem.mem[otherchar]
    if otherpair and otherpair.type==1 then
      local matching_pair_pos=info_line.findepaire(line,col-1,otherchar,otherpair.paire)
      if matching_pair_pos and line:sub(matching_pair_pos-1,matching_pair_pos-1)==' ' then
        utils.setline(line:sub(1,col-2)..line:sub(col,matching_pair_pos-2)..line:sub(matching_pair_pos))
        utils.moveh()
        return
      end
    end
  elseif conf.multichar and mem.extensions.multichar then
    for newkey,opt in pairs(mem.mem) do
      local bool=#newkey>1 and opt.type~=2
      if bool and opt.ext.filetype and #opt.ext.filetype~=0 then
        bool=opt.ext.filetype[vim.o.filetype]
      end
      if bool and vim.tbl_contains(mem.extensions.multichar.conf or {},newkey) then
        bool=not line:sub(col-#newkey-1,col-#newkey-1):match('%a')
      end
      if bool and line:sub(col-#newkey,col-1)==newkey then
        utils.delete(line,col,#newkey,#newkey)
      end
    end
  end
  vim.api.nvim_feedkeys(conf.fallback or '\x80kb','n',true)
end
function M.setup()
  if conf.enable then
    vim.keymap.set('i','<bs>',M.backspace,gconf.mapopt)
    if gconf.cmap then
      vim.keymap.set('c','<bs>',M.backspace,gconf.mapopt)
    end
  end
end
return M
