local cb = require('diffview.config').diffview_callback

require'diffview'.setup({
    file_panel = {
        win_config = {
            position = 'left',
            width = 35,
        },
        listing_style = 'list',
    },
    key_bindings = {
        disable_defaults = false,
        view = {
            ['<C-n>'] = cb('toggle_files'),
        },
        file_panel = {
            ['<C-n>'] = cb('toggle_files'),
        },
        file_history_panel = {
            ['<C-n>'] = cb('toggle_files'),
        },
    },
    hooks = {
        view_opened = function(view)
            -- Hide the file browser for diffviews but not for history views
            if(view:class():name() == 'DiffView') then
                vim.api.nvim_command('DiffviewToggleFiles')
            end
        end,
        diff_buf_win_enter = function()
            -- Disable line wrap, list chars and relative numbers
            vim.opt_local.wrap = false
            vim.opt_local.list = false
            vim.opt_local.relativenumber = false

            -- Diffs and visual selection use the same color. Let's change the
            -- highlight for visual selections to still see them
            vim.opt_local.winhighlight = 'Visual:VisualDiff'

            -- Disable indentation guides
            require("indent_blankline.commands").disable()
        end,
    }
})

-- KEYBINDINGS
local wk = require('which-key')
wk.register({
    d = {
        name = 'DiffView',
        i = {
            '<Cmd>DiffviewOpen<CR>',
            'diff against index',
        },
        h = {
            '<Cmd>DiffviewOpen HEAD<CR>',
            'diff against HEAD',
        },
        c = {
            '<Cmd>DiffviewFileHistory<CR>',
            'diff against commit history'
        },
        q = {
            '<Cmd>DiffviewClose<CR>',
           'quit diffview'
        },
        o = ':diffget',
        p = ':diffput',
    }
}, { prefix = '<Leader>' })

-- HIGHLIGHTS
local function highlight(group_name, group_setting)
    vim.api.nvim_set_hl(0, group_name, group_setting)
end

highlight('DiffviewFilePanelTitle', { link = 'Title' })
highlight('DiffviewFilePanelFileName', { link = 'Normal' })
highlight('DiffviewFilePanelPath', { link = 'Normal' })
highlight('DiffviewFilePanelRootPath', { link = 'SpecialKey' })
highlight('DiffviewFilePanelCounter', { link = 'NonText' })
highlight('DiffviewSecondary', { link = 'Conditional' })
