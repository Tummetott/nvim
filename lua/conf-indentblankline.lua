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

-- local autocmd = vim.api.nvim_create_autocmd
-- local autogroup = vim.api.nvim_create_augroup
--
-- local group = autogroup('TODO', { clear = true })
-- autocmd('DiffUpdated', {
--     callback = function()
--         if vim.wo.diff then
--             vim.api.nvim_command('IndentBlanklineDisable')
--         end
--     end,
--     group = group
-- })
