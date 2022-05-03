local cb = require'diffview.config'.diffview_callback

require'diffview'.setup({
    file_panel = {
        position = 'left',
        width = 35,
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
        view_opened = function()
            -- Hide the file browser. I can toggle it with a shortcut
            vim.api.nvim_command('DiffviewToggleFiles')
        end,
        diff_buf_read = function()

            -- Turn off line wrapping and list chars and relative numbers
            vim.opt_local.wrap = false
            vim.opt_local.list = false
            vim.opt_local.relativenumber = false

            -- Disable indentation guides
            vim.api.nvim_command('IndentBlanklineDisable')

            -- Differences are highlightes like my 'Visual' highlight group.
            -- Alter the 'Visual' group for the duration of the diffmode
            local palette = require'conf-colorscheme'.get_current_base16_palette()
            vim.api.nvim_set_hl(0, 'Visual', { bg = palette.base02 })
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
            '<Cmd>DiffviewFileHistory<CR>',
            'diff against commit history'
        },
        c = {
            '<Cmd>DiffviewClose<CR>',
           'close diffview'
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
