require('which-key').setup {
    plugins = {
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
    triggers_blacklist = {
        -- Don't trigger which-key when typing a mark or a register
        n = { [[']], [["]]}
  },
}
