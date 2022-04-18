require('gitsigns').setup({
    signcolumn = true,
    signs = {
        add = {
            text = '│'
        },
        change = {
            text = '│'
        }
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local wk = require('which-key')

        wk.register({
            [']h'] = {
                function()
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end,
                'Go to next hunk'
            },
            ['[h'] = {
                function()
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end,
                'Go to previous hunk'
            }
        }, { buffer = bufnr })

        wk.register({
            g = {
                name = 'Gitsigns',
                s = { gs.stage_hunk, 'stage hunk' },
                S = { gs.stage_buffer, 'stage buffer' },
                u = { gs.undo_stage_hunk, 'undo stage hunk' },
                r = { gs.reset_hunk, 'reset hunk' },
                R = { gs.reset_buffer, 'reset buffer' },
                p = { gs.preview_hunk, 'preview hunk' },
                b = { gs.blame_line, 'blame current line' },
                l = { gs.toggle_current_line_blame, 'toggle current line blame' },
                -- TODO: Quick and dirty implementation. Improve this code block
                d = { function ()
                    gs.diffthis()
                    vim.opt.relativenumber = false
                    vim.api.nvim_command('IndentBlanklineDisable!')
                    local palette = require'conf-colorscheme'.get_current_base16_palette()
                    vim.api.nvim_set_hl(0, 'Visual', { bg = palette.base02 })
                end, 'diff against index' },
                D = { function() gs.diffthis('~') end, 'diff against last commit' },
                v = { gs.toggle_deleted, 'toggle deleted lines' },
            }
        }, { prefix = '<Leader>', buffer = bufnr })

        -- In visual mode, it is possible to stage and reset partial hunks
        wk.register({
            g = {
                s = { ':Gitsigns stage_hunk<CR>', 'stage selected' },
                r = { ':Gitsigns reset_hunk<CR>', 'reset selected' }
            }
        }, { prefix = '<Leader>',  buffer = bufnr, mode = 'v' })

        -- Toggle signs in the signcolumn
        wk.register({
            g = { gs.toggle_signs, 'gitsigns' }
        }, { prefix = 'yo', buffer = bufnr })

        -- Add textobject
        wk.register({
            ih = { ':<C-U>Gitsigns select_hunk<CR>', 'inner hunk' }
        }, { mode = 'o', buffer = bufnr })

        -- Need to set this for mode 'o' and 'x'. Once the following issue is
        -- resolved, I can put it into one codeblock:
        -- https://github.com/folke/which-key.nvim/issues/267
        wk.register({
            ih = { ':<C-U>Gitsigns select_hunk<CR>', 'inner hunk' }
        }, { mode = 'x', buffer = bufnr })
    end
})
