local wk = require('which-key')

wk.setup {
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
        n = { [[']], [["]], [[`]]}
  },
}

wk.register({
    z = {
        j = 'Go to next fold',
        k = 'Go to previous fold',
    }
})

-- Different color for keymap descriptions in which-key
vim.api.nvim_set_hl(0, 'WhichKeyDesc', { link = 'Special' })
