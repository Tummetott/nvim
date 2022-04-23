local cat = {
    '⠀⡀⠀⠀⠀⢠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      ',
    '⠀⠈⣿⢶⣦⡏⠙⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      ',
    '⠀⢀⣴⣿⣿⣿⣿⣾⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      ',
    '⠀⣿⡿⢛⣿⣿⣿⣿⢿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      ',
    '⢀⣿⣷⣿⣿⣿⣿⠃⣾⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀      ',
    '⠀⠺⠿⠿⣿⣿⣿⣼⣿⣿⣿⣿⣿⣠⣄⡀⠀⠀⠀⠀⠀⠀      ',
    '⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣷⣆⠀⠀⠀⠀      ',
    '⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⠏⣾⣿⣿⣿⣿⣿⡀⠀⠀⠀      ',
    '⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⡟⣰⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀      ',
    '⠀⠀⠀⠀⠻⣿⣿⣿⣿⢏⣴⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀      ',
    '⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣿⢣⣿⡿⢟⣿⣿⣿⠀⠀      ',
    '⠀⠀⠀⠀⠀⠀⢹⣷⣽⢻⣿⣿⠃⠞⣫⣴⣿⣿⣿⣿⡟⠀      ',
    '⠀⠀⠀⠀⠀⢳⣄⠙⠇⢸⣿⠃⣠⣾⣿⣿⣿⣿⣿⣿⡇⠀      ',
    '⠀⠀⠀⠀⠀⠀⢿⣷⣤⣈⠛⠀⢿⣿⣿⣿⣿⣿⣿⠟⠀⠀      ',
    '⠀⠀⠀⠀⠀⠀⢀⡉⠛⢿⣿⣶⣤⣈⣉⣉⣉⣉⣉⣰⣿⠄      ',
    '⠀⠀⠀⠀⠀⠀⠏⢴⣷⡦⠌⠙⠻⢿⡿⠿⠿⠿⠿⠿⠃⠀      ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      ',
}

local bird = {
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⡿⠟⢛⡙⠓⣤⣤⡤⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡏⢀⣠⣭⣥⠈⡟⠉⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣷⣌⣛⣙⢿⣷⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣿⣿⣿⣿⣿⣿⠿⠿⠧⠉⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠿⢛⣩⣴⣿⣿⣄⠀⢀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢢⣿⣿⠟⣡⣾⣿⣿⣿⣿⣿⡿⢃⡌⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⢾⡿⢋⣾⣿⣿⣿⣿⣿⡿⠟⠁⣸⠃⠃⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⢀⠀⣰⣇⠀⠀⠀⠀⠀⠀⡷⠦⢖⡤⠘⡿⠿⢛⣉⣥⣴⡶⠋⢠⡟⡸⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠈⠛⠻⣿⣷⣦⣤⠄⢰⡷⡰⠞⡩⢖⡥⢒⠞⡫⣻⠟⢁⡴⢡⡿⢰⠃⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠛⠻⠟⠉⠉⣼⢎⣤⠖⣫⢖⡫⠒⢁⡬⢊⣵⠞⠟⣡⡿⢡⠃⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡃⠋⠔⠉⠒⣉⡤⠞⣁⣀⠀⠀⠀⣴⠟⣱⠃⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⡁⢒⣕⠵⢚⣥⡄⠸⢟⣿⣿⣿⣶⣶⡟⠑⢛⠟⢭⣥⣀⣠⣄',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣫⣈⠿⠋⢀⣴⡿⠛⠁⠀⠐⠉⠙⠉⠉⠀⠀⠄⠁⠀⠀⠈⠻⣿⣿',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⡀⠠⠚⠁⠾⠛⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛',
    '⠀⠀⠀⠀⠀⠀⠀⣠⠂⣀⣤⡴⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⣠⣾⣫⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⢀⣴⣾⢟⣽⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⢀⣴⡿⢟⣵⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠾⢻⣆⡟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
}

require('startup').setup({
    header = {
        type = 'text',
        align = 'center',
        highlight = 'GreeterHeader',
        content = cat,
    },
    center = {
        type = 'mapping',
        align = 'center',
        highlight = 'GreeterCenter',
        -- The leading whitespaces are a quick and dirty fix to center the
        -- content
        content = {
            { '                New File', 'enew', '<nop>' },
            { '                Find File', 'Telescope find_files', '<nop>' },
            { '                Find Word', 'Telescope live_grep', '<nop>' },
            { '                Recent Files', 'Telescope oldfiles', '<nop>' },
            { '                Colorschemes', 'Telescope colorscheme', '<nop>' },
            { '                Search Help', 'Telescope help_tags', '<nop>' },
        },
    },
    footer = {
        type = 'text',
        align = 'center',
        highlight = 'GreeterFooter',
        content = function()
            local n = vim.tbl_count(_G.packer_plugins)
            return { string.format('im is running with %d plugins ', n) }
        end,
    },
    options = {
        -- Don't display mappings. In my case I define no mappings (only NOPs)
        mapping_keys = false,
        -- if < 0 fraction of screen width
        -- if > 0 numbers of column
        cursor_column = 0.48,
        disable_statuslines = true,
        -- Amount of empty lines before each section
        paddings = { 2, 1, 1 },
    },
    parts = { 'header', 'center', 'footer' }
})
