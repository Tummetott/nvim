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
