require("telescope").setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
    }
}

-- Telescope mappings
local keymap = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

keymap('n', '<Leader>ff', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
keymap('n', '<Leader>fw', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], opt)
keymap('n', '<Leader>fb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
keymap('n', '<Leader>fh', [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)
keymap('n', '<Leader>fo', [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)
