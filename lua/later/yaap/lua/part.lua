local M={}
function M.open_par_before(pair,opt)
  local stop=pair
  local index=opt.ind
  local begin=opt.pair
  local line=opt.line
  local count=1
  for i=index-1,0,-1 do
    if line:sub(i,i)==begin then
      count=count-1
    elseif line:sub(i,i)==stop then
      count=count+1
    end
    if count==0 then
      return index
    end
  end
end
function M.open_par_after(pair,opt)
  local begin=pair
  local stop=opt.stop
  local index=opt.ind
  local line=opt.line
  local count=0
  for i=0,index-1 do
    if line:sub(i,i)==stop then
      count=count-1
    elseif line:sub(i,i)==begin then
      count=count+1
    end
    if count<0 then
      count=0
    end
  end
  count=count+1
  for i=index,#line do
    if line:sub(i,i)==stop then
      count=count-1
    elseif line:sub(i,i)==begin then
      count=count+1
    end
    if count==0 then
      return i
    end
  end
end

function M.open_par_ambigous_before(pair,opt)
  local index=opt.ind
  local line=opt.line
  local count=0
  for i=0,index-1 do
    if line:sub(i,i)==pair then
      count=count+1
    end
  end
  return count%2==1
end
function M.open_par_ambigous_after(pair,opt)
  local index=opt.ind
  local line=opt.line
  local count=0
  for i=index,#line do
    if line:sub(i,i)==pair then
      count=count+1
    end
  end
  return count%2==1
end
return M
