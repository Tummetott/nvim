local wk = require('which-key')

-- Remap leader key to space
vim.g.mapleader = ' '

-- Use J and K in visual mode to move enitre lines. Indentation is adjusted
-- automatically
wk.register({
    J = {
        ":move '>+1<CR>gv=gv",
        'Move selection one line down'
    },
    K = {
        ":move '<-2<CR>gv=gv",
        'Move selection one line up'
    }
}, { mode = 'x' })

-- Use CTRL-j and CTRL-k to move a line from within insert mode. Indentation is
-- adjusted automatically
wk.register({
    ['<C-j>'] = {
        '<Esc>:move .+1<CR>==a',
        'Move current line one line below and re-indent'
    },
    ['<C-k>'] = {
        '<Esc>:move .-2<CR>==a',
        'Move current line one line above and re-indent'
    }
}, { mode = 'i' })

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
        'Copy to system clipboard'
    }
}, { mode = 'x' })

wk.register({
    ['gV'] = {
        '`[v`]',
        'Select previous pasted text',
    },
    ['g='] = {
        '`[v`]=',
        'Auto indent previous pasted text'
    }
})

-- Use emacs bindings to navigate forward and backward in insert mode
wk.register({
    ['<C-f>'] = {
        '<Right>',
        'Right'
    },
    ['<C-b>'] = {
        '<Left>',
        'Left'
    }
}, { mode = 'i' })

-- Use emacs bindings to navigate inside the command mode
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
    ['gQ'] = {
        '<Nop>',
        'which_key_ignore' -- Don't display the keybinding
    }
})

-- Mapping to clear the quickfix list
wk.register({
    q = {
        name = 'Quickfix list',
        c = { function() vim.fn.setqflist({}) end, 'clear' },
    }
}, { prefix = '<Leader>' })

-- Let's integrate all mappings from 'unimpaired' into 'which-key'. Also add
-- own mappings following the same syntax
wk.register({
    ['['] = {
        a = 'Edit previous file in argument list',
        A = 'Edit first file in argument list',
        b = 'Go to previous buffer in buffer list',
        B = 'Go to first buffer in buffer list',
        l = 'Go to previous item in location list',
        L = 'Go to first item in location list',
        ['<C-l>'] = 'Go to previous file in location list',
        q = 'Go to previous item in quickfix list',
        Q = 'Go to first item in quickfix list',
        ['<C-q>'] = 'Go to previous file in quickfix list',
        t = 'Go to previous tab',
        T = 'Go to first tab',
        ['<Space>'] = 'Add blank line above the cursor',
        e = 'Exchange current line with line above',
        ['<C-t>'] = 'which_key_ignore',
        f = 'Go to preceding file alphabetically',
        p = 'Paste above and fix indent',
        w = {
            function() vim.fn.search('\\s\\+$', 'bw') end,
            'Go to previous trailing whitespace',
        },
        x = 'which_key_ignore',
        y = 'which_key_ignore',
        u = 'which_key_ignore',
        C = 'which_key_ignore',
        n = 'which_key_ignore',
        P = 'which_key_ignore',
        o = {
            name = 'Enable option',
            i = { '<Cmd>IndentBlanklineEnable<CR>', 'indentation guides' },
            c = { require'utils/functions'.enable_cursorline, 'cursorline' },
            x = { require'utils/functions'.enable_cursorcross, 'cursorcross' },
            d = 'diff',
            h = 'hlsearch',
            l = 'list',
            n = 'number',
            r = 'relativenumber',
            s = 'spell',
            u = 'cursorcolumn',
            v = 'virtualedit',
            w = 'wrap',
        },
    },
    [']'] = {
        a = 'Edit next file in argument list',
        A = 'Edit last file in argument list',
        b = 'Go to next buffer in buffer list',
        B = 'Go to last buffer in buffer list',
        l = 'Go to next item in location list',
        L = 'Go to last item in location list',
        ['<C-l>'] = 'Go to next file in location list',
        q = 'Go to next item in quickfix list',
        Q = 'Go to last item in quickfix list',
        ['<C-q>'] = 'Go to next file in quickfix list',
        t = 'Go to next tab',
        T = 'Go to last tab',
        ['<Space>'] = 'Add blank line below the cursor',
        e = 'Exchange current line with line below',
        ['<C-t>'] = 'which_key_ignore',
        f = 'Go to succeeding file alphabetically',
        p = 'Paste below and fix indent',
        w = {
            function() vim.fn.search('\\s\\+$', 'w') end,
            'Go to next trailing whitespace',
        },
        x = 'which_key_ignore',
        y = 'which_key_ignore',
        u = 'which_key_ignore',
        C = 'which_key_ignore',
        n = 'which_key_ignore',
        P = 'which_key_ignore',
        o = {
            name = 'Disable option',
            i = { '<Cmd>IndentBlanklineDisable<CR>', 'indentation guides' },
            c = { require'utils/functions'.disable_cursorline, 'cursorline' },
            x = { require'utils/functions'.disable_cursorcross, 'cursorcross' },
            d = 'diff',
            h = 'hlsearch',
            l = 'list',
            n = 'number',
            r = 'relativenumber',
            s = 'spell',
            u = 'cursorcolumn',
            v = 'virtualedit',
            w = 'wrap',
        },
    },
    ['yo'] = {
        name = 'Toggle option',
        i = { '<Cmd>IndentBlanklineToggle<CR>', 'indentation guides' },
        c = { require'utils/functions'.toggle_cursorline, 'cursorline' },
        x = { require'utils/functions'.toggle_cursorcross, 'cursorcross' },
        d = 'diff',
        h = 'hlsearch',
        l = 'list',
        n = 'number',
        r = 'relativenumber',
        s = 'spell',
        u = 'cursorcolumn',
        v = 'virtualedit',
        w = 'wrap',
    },
    ['='] = {
        p = 'which_key_ignore',
        P = 'which_key_ignore',
        s = 'which_key_ignore',
    },
})

-- Press Tab or S-Tab in normal mode to go to next/previous buffer
-- map('n', '<Tab>', '<Cmd>bnext<CR>')
-- map('n', '<S-Tab>', '<Cmd>bprevious<CR>')
