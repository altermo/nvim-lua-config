require('nvim-tree').setup({
    renderer={
    full_name=true,
        icons={
        padding='',
        glyphs={
            default='',
            symlink='',
            folder={
                arrow_closed='',
                arrow_open='',
                default='+',
                open='-',
                empty='#',
                empty_open='_',
                symlink='+',
                symlink_open='-',
    }}}},
    view={
        width=20,
    }
})
