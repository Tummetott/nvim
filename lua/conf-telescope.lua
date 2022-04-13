local layout = require 'telescope.actions.layout'
local actions = require 'telescope.actions'

require("telescope").setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        preview = {
            hide_on_startup = true,
        },
        cycle_layout_list = { 'vertical', 'horizontal' },
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
    },
}

-- Telescope keymapping
require('which-key').register({
    f = {
        name = 'Find',
        f = { require 'telescope.builtin'.find_files, 'file' },
        w = { require 'telescope.builtin'.live_grep, 'word' },
        b = { require 'telescope.builtin'.buffers, 'buffer' },
        h = { require 'telescope.builtin'.help_tags, 'help' },
        o = { require 'telescope.builtin'.oldfiles, 'oldfile' },
        m = { require 'telescope.builtin'.man_pages, 'man page' },
        c = { require 'telescope.builtin'.command_history, 'command history' },
        s = { require 'telescope.builtin'.spell_suggest, 'spell suggest' },
        r = { require 'telescope.builtin'.lsp_references, 'lsp reference' },
        a = { require 'telescope.builtin'.lsp_code_actions, 'lsp code action' },
        d = { function()
                  require 'telescope.builtin'.find_files({ cwd = '~/.dotfiles' })
              end, 'dotfile' },
    },
}, { prefix = '<leader>' })
