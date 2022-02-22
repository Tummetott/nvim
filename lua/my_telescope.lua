local layout = require'telescope.actions.layout'
local actions = require'telescope.actions'

require("telescope").setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        preview = {
            hide_on_startup = true,
        },
        cycle_layout_list = {'vertical', 'horizontal'},
        mappings = {
            i = {
                -- By default, I dont show a prefiew of a file. However, I set
                -- a keybinding to toggle the preview window
                ['<C-h>'] = layout.toggle_preview,
                -- Telescope mapps <C-u> to scroll up in my preview window.
                -- Let's unmap this in order to get my delete line behavior back
                ['<C-u>'] = false,
                -- I prefer to open a file in a horizontal split with C-s instead of C-x
                ['<C-s>'] = actions.select_horizontal,
                ['<c-x>'] = false
            },
            n = {
                ['<C-h>'] = layout.toggle_preview,
                ['<C-s>'] = actions.select_horizontal,
                ['<c-x>'] = false
            },
        }
    },
    pickers = {
        buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
            theme = 'dropdown',
            mappings = {
                i = {
                    ['<c-x>'] = actions.delete_buffer,
                }
            }
        },
        lsp_code_actions = {
            theme = 'cursor',
        }
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
keymap('n', '<Leader>fm', [[<Cmd>lua require('telescope.builtin').man_pages()<CR>]], opt)
keymap('n', '<Leader>fc', [[<Cmd>lua require('telescope.builtin').command_history()<CR>]], opt)
keymap('n', '<Leader>fs', [[<Cmd>lua require('telescope.builtin').spell_suggest()<CR>]], opt)
keymap('n', '<Leader>a', [[<Cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], opt)

-- Special shortcut to find a dotfile
keymap('n', '<Leader>ed', [[<CMD>Telescope find_files cwd=~/.dotfiles<CR>]], opt)
