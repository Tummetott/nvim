require("indent_blankline").setup {
    -- char = '',
    -- show_current_context = true,
    use_treesitter = true,
    filetype_exclude = {
        'NvimTree',
        'man',
        'help',
        'dashboard',
    },
}

require('which-key').register({
    ['yoi'] = { '<Cmd>IndentBlanklineToggle<CR>', 'indentation guides' },
    ['[oi'] = { '<Cmd>IndentBlanklineEnable<CR>', 'indentation guides' },
    [']oi'] = { '<Cmd>IndentBlanklineDisable<CR>', 'indentation guides' },
})
