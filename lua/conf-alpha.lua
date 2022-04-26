local cat = {
    '⠀⡀⠀⠀⠀⢠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ',
    '⠀⠈⣿⢶⣦⡏⠙⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ',
    '⠀⢀⣴⣿⣿⣿⣿⣾⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ',
    '⠀⣿⡿⢛⣿⣿⣿⣿⢿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ',
    '⢀⣿⣷⣿⣿⣿⣿⠃⣾⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀   ',
    '⠀⠺⠿⠿⣿⣿⣿⣼⣿⣿⣿⣿⣿⣠⣄⡀⠀⠀⠀⠀⠀⠀   ',
    '⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣷⣆⠀⠀⠀⠀   ',
    '⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⠏⣾⣿⣿⣿⣿⣿⡀⠀⠀⠀   ',
    '⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⡟⣰⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀   ',
    '⠀⠀⠀⠀⠻⣿⣿⣿⣿⢏⣴⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀   ',
    '⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣿⢣⣿⡿⢟⣿⣿⣿⠀⠀   ',
    '⠀⠀⠀⠀⠀⠀⢹⣷⣽⢻⣿⣿⠃⠞⣫⣴⣿⣿⣿⣿⡟⠀   ',
    '⠀⠀⠀⠀⠀⢳⣄⠙⠇⢸⣿⠃⣠⣾⣿⣿⣿⣿⣿⣿⡇⠀   ',
    '⠀⠀⠀⠀⠀⠀⢿⣷⣤⣈⠛⠀⢿⣿⣿⣿⣿⣿⣿⠟⠀⠀   ',
    '⠀⠀⠀⠀⠀⠀⢀⡉⠛⢿⣿⣶⣤⣈⣉⣉⣉⣉⣉⣰⣿⠄   ',
    '⠀⠀⠀⠀⠀⠀⠏⢴⣷⡦⠌⠙⠻⢿⡿⠿⠿⠿⠿⠿⠃⠀   ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ',
}

local bird = {
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⡿⠟⢛⡙⠓⣤⣤⡤⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡏⢀⣠⣭⣥⠈⡟⠉⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣷⣌⣛⣙⢿⣷⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣿⣿⣿⣿⣿⣿⠿⠿⠧⠉⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠿⢛⣩⣴⣿⣿⣄⠀⢀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢢⣿⣿⠟⣡⣾⣿⣿⣿⣿⣿⡿⢃⡌⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⢾⡿⢋⣾⣿⣿⣿⣿⣿⡿⠟⠁⣸⠃⠃⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⢀⠀⣰⣇⠀⠀⠀⠀⠀⠀⡷⠦⢖⡤⠘⡿⠿⢛⣉⣥⣴⡶⠋⢠⡟⡸⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠈⠛⠻⣿⣷⣦⣤⠄⢰⡷⡰⠞⡩⢖⡥⢒⠞⡫⣻⠟⢁⡴⢡⡿⢰⠃⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠛⠻⠟⠉⠉⣼⢎⣤⠖⣫⢖⡫⠒⢁⡬⢊⣵⠞⠟⣡⡿⢡⠃⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡃⠋⠔⠉⠒⣉⡤⠞⣁⣀⠀⠀⠀⣴⠟⣱⠃⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⡁⢒⣕⠵⢚⣥⡄⠸⢟⣿⣿⣿⣶⣶⡟⠑⢛⠟⢭⣥⣀⣠⣄',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣫⣈⠿⠋⢀⣴⡿⠛⠁⠀⠐⠉⠙⠉⠉⠀⠀⠄⠁⠀⠀⠈⠻⣿⣿',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⡀⠠⠚⠁⠾⠛⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛',
    '⠀⠀⠀⠀⠀⠀⠀⣠⠂⣀⣤⡴⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⣠⣾⣫⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⢀⣴⣾⢟⣽⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⢀⣴⡿⢟⣵⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠾⢻⣆⡟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
}

local header = {
    type = 'text',
    val = cat,
    opts = {
        position = 'center',
        hl = 'GreeterHeader',
    },
}

local function button(text, command)
    return {
        val = text,
        on_press = command,
        type = 'button',
        opts = {
            position = 'center',
            cursor = 5,
            hl_shortcut = 'GreeterCenter',
            hl = 'GreeterCenter',
        }
    }
end

local center = {
    type = 'group',
    val = {
        button('  New file   ', function () vim.api.nvim_command('enew') end),
        button('  Find File  ', require('telescope.builtin').find_files),
        button('  Find Word  ', require('telescope.builtin').live_grep),
        button('    Recent Files', require('telescope.builtin').oldfiles),
        button('    Colorschemes', require('telescope.builtin').colorscheme),
        button('    Search Help  ', require('telescope.builtin').help_tags),
    },
    opts = {
        spacing = 1, -- One line spacing
    },
}

local footer = {
    type = 'text',
    val = function()
        return string.format('im is running with %d plugins ', vim.tbl_count(_G.packer_plugins))
    end,
    opts = {
        position = 'center',
        hl = 'GreeterFooter',
    },
}

local config = {
    layout = {
        { type = 'padding', val = 2 },
        header,
        { type = 'padding', val = 2 },
        center,
        { type = 'padding', val = 2 },
        footer,
    },
    opts = {
        margin = 5,
    },
}

require'alpha'.setup(config)

local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup
local group = autogroup('AlphaQuit', { clear = true })

-- Quit the greeter with 'q'
autocmd('User AlphaReady', {
    callback = function()
        if vim.bo.filetype == 'alpha' then
            require('which-key').register({
                q = {
                    '<Cmd>quit<CR>',
                    'Quit'
                }
            }, { buffer = 0 })
        end
    end,
    group = group,
})
