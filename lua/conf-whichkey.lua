require('which-key').setup {
    plugins = {
        marks = false,
        registers = false,
        spelling = {
            enabled = true,
        },
    },
    key_labels = {
        ['<NL>'] = '<C-J>',
        ['<C-_>'] = '<C-/>',
    },
    window = {
        border = 'single',
        padding = { 1, 1, 1, 1 },
    },
    show_help = false,
}
