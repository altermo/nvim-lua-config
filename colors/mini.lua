if vim.o.background=='dark' then
    require('mini.base16').setup({palette={
        base00='#191919', --fourground
        base01='#242424', --virtual fourground
        base02='#600000', --visual mode
        base03='#444444', --comments
        base04='#555555', --numberline number (not relativenumber)
        base05='#888888', --cursor and text
        base06='#ffffff', --unused?
        base07='#444444', --scroolbar
        ---
        base08='#ffa82b', --general text
        base09='#cc7e46', --number
        base0A='#46a436', --statment
        base0B='#9ff895', --string
        base0C='#ca6ecf', --statment
        base0D='#42d08a', --statment
        base0E='#ffc4ff', --statment
        base0F='#00a5c5', --statment
    }})
else
    require('mini.base16').setup({palette={
        base00='#fbf1c7', --fourground
        base01='#ebdbb2', --virtual fourground
        base02='#600000', --visual mode
        base03='#7bdbb1', --comments (relativenumber)
        base04='#555555', --numberline number (not relativenumber)
        base05='#888888', --cursor and text
        base06='#ffffff', --unused?
        base07='#444444', --scroolbar
        ---
        base08='#ffa82b', --general text
        base09='#cc7e46', --number
        base0A='#46a436', --statment
        base0B='#307121', --string
        base0C='#ca6ecf', --statment
        base0D='#42d08a', --statment
        base0E='#FF1493', --statment
        base0F='#00a5c5', --statment
    }})
end
vim.g.terminal_color_0='#000000'
vim.g.terminal_color_1='#FF0000'
vim.g.terminal_color_2='#00FF00'
vim.g.terminal_color_3='#FFFF00'
vim.g.terminal_color_4='#0000FF'
vim.g.terminal_color_5='#FF00FF'
vim.g.terminal_color_6='#00FFFF'
vim.g.terminal_color_7='#EEEEEE'
vim.g.terminal_color_8='#888888'
vim.g.terminal_color_9='#FF8888'
vim.g.terminal_color_10='#88FF88'
vim.g.terminal_color_11='#FFFF88'
vim.g.terminal_color_12='#8888FF'
vim.g.terminal_color_13='#FF88FF'
vim.g.terminal_color_14='#88FFFF'
vim.g.terminal_color_15='#FFFFFF'
vim.g.colors_name='mini'
