return function(opt)
    if opt.line:sub(opt.ind-2,opt.ind-1)=='##' then
        opt.pair='##'..opt.pair
    end
end
