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
                ['<C-x>'] = false,
                -- If I select items, i send only selected items to the
                -- quickfix list. If I don't select any items, I send every
                -- item
                ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
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
local map = vim.keymap.set

map('n', '<Leader>ff', require'telescope.builtin'.find_files)
map('n', '<Leader>fw', require'telescope.builtin'.live_grep)
map('n', '<Leader>fb', require'telescope.builtin'.buffers)
map('n', '<Leader>fh', require'telescope.builtin'.help_tags)
map('n', '<Leader>fo', require'telescope.builtin'.oldfiles)
map('n', '<Leader>fm', require'telescope.builtin'.man_pages)
map('n', '<Leader>fc', require'telescope.builtin'.command_history)
map('n', '<Leader>fs', require'telescope.builtin'.spell_suggest)
map('n', '<Leader>fr', require'telescope.builtin'.lsp_references)
map('n', '<Leader>ca', require'telescope.builtin'.lsp_code_actions)

-- Special shortcut to find a dotfile
map('n', '<Leader>ed', function()
    require'telescope.builtin'.find_files({cwd = '~/.dotfiles'})
end)
