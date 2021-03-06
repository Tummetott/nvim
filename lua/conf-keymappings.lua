local wk = require('which-key')

-- Remap leader key to space
vim.g.mapleader = ' '

-- Use J and K in visual mode to move enitre lines. Indentation is adjusted
-- automatically
wk.register({
    J = {
        ":move '>+1<CR>gv=gv",
        'Move selection down and re-indent',
    },
    K = {
        ":move '<-2<CR>gv=gv",
        'Move selection up and re-indent',
    }
}, { mode = 'x' })

-- Use CTRL-j and CTRL-k to move a line from within insert mode. Indentation is
-- adjusted automatically
wk.register({
    ['<C-j>'] = {
        '<Cmd>move .+1<CR><Cmd>norm ==<CR>',
        'Move current line one line below and re-indent',
    },
    ['<C-k>'] = {
        '<Cmd>move .-2<CR><Cmd>norm ==<CR>',
        'Move current line one line above and re-indent',
    }
}, { mode = 'i' })

wk.register({
    n = {
        'nzz',
        'Next match'
    },
    N = {
        'Nzz',
        'Previous match'
    }
})

-- Y yanks from the cursor position to the end of the line. The default vim
-- behaviour is just inconsistent
wk.register({
    Y = {
        'y$',
        'Copy to end of line'
    }
})

-- Y in visual mode copies to system clipboard
wk.register({
    Y = {
        '"+y',
        'Copy selection to system clipboard'
    }
}, { mode = 'x' })

-- The internal gv selects the previous selection. Now gV selects the previous
-- paste
wk.register({
    ['gV'] = {
        '`[v`]',
        'Select previous pasted text',
    },
})

-- Paste clipboard one line below or above and reindent
wk.register({
    [']p'] = {
        '<Cmd>put<CR>`[v`]=',
        'Paste below linewise and re-indent',
    },
    ['[p'] = {
        '<Cmd>put!<CR>`[v`]=',
        'Paste above linewise and re-indent',
    },
})

-- Use some emacs bindings in insert mode
wk.register({
    ['<C-e>'] = {
        '<C-o>A',
        'End of line'
    },
    ['<C-a>'] = {
        '<Cmd>norm 0<CR>',
        'Beginning of line'
    },
    ['<C-f>'] = {
        '<Right>',
        'Right'
    },
    ['<C-b>'] = {
        '<Left>',
        'Left'
    }
}, { mode = 'i' })

-- Use some emacs bindings in command mode
wk.register({
    ['<C-a>'] = {
        '<C-b>',
        'Start of line'
    },
    ['<C-f>'] = {
        '<Right>',
        'Right'
    },
    ['<C-b>'] = {
        '<Left>',
        'Left'
    }
}, { mode = 'c', silent = false })

-- The first <CR> after a search clears the highlights. Only usefull when
-- hlsearch is enabled
wk.register({
    ['<CR>'] = {
        "v:hlsearch ? '<Cmd>noh<CR>' : '<CR>'",
        'Clear search highlights'
    }
}, { expr = true })

-- Disable ex mode. This mode is useless and it's annoying to quit out of it
-- when entered accidentally
wk.register({
    ['gQ'] = { '<NOP>', 'which_key_ignore' }
})

-- Mapping to clear the quickfix list
wk.register({
    q = {
        name = 'Quickfix list',
        c = { function() vim.fn.setqflist({}) end, 'clear' },
    }
}, { prefix = '<Leader>' })

-- Go to next, previous trailing whitespace
wk.register({
    [']w'] = {
        function() vim.fn.search('\\s\\+$', 'w') end,
        'Next trailing whitespace',
    },
    ['[w'] = {
        function() vim.fn.search('\\s\\+$', 'bw') end,
        'Previous trailing whitespace',
    }
})

-- Since I have cursorline always enabled in order to highlight the current
-- line number, the toggeling of the cursorline highlight does not work. Let's
-- write a keymap to get this behaviour back.
wk.register({
    ['['] = {
        o = {
            name = 'Enable option',
            c = { require('utils/functions').enable_cursorline, 'cursorline' },
            x = { require('utils/functions').enable_cursorcross, 'cursorcross' },
        }
    },
    [']'] = {
        o = {
            name = 'Disable option',
            c = { require('utils/functions').disable_cursorline, 'cursorline' },
            x = { require('utils/functions').disable_cursorcross, 'cursorcross' },
        }
    },
    ['yo'] = {
        name = 'Toggle option',
        c = { require('utils/functions').toggle_cursorline, 'cursorline' },
        x = { require('utils/functions').toggle_cursorcross, 'cursorcross' },
    }
})
