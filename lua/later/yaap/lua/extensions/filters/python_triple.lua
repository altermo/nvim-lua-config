return {
    {function(opt)
        local triple='""' and opt.pair=='"' or "''"
        if opt.line:sub(opt.ind-2,opt.ind-1)==triple then
            opt.pair=triple..opt.pair
        end
        return opt
    end,
        char={'"',"'"},ft='python'
    }
}
