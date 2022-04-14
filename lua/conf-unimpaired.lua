-- Unimpaired provides great keybindings but does not integrate into which-key.
-- Let's add a description manually and remove some of the unimportant bindings
require('which-key').register({
    ['['] = {
        a = ':previous',
        A = ':first',
        b = ':bprevious',
        B = ':bfirst',
        C = { '<NOP>', 'which_key_ignore' },
        e = 'Exchange line with line above',
        f = 'Go to preceding file in directory',
        l = ':lprevious',
        L = ':lfirst',
        ['<C-l>'] = ':lpfile',
        n = { '<NOP>', 'which_key_ignore' },
        o = {
            name = 'Enable option',
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
        P = { '<NOP>', 'which_key_ignore' },
        q = ':cprevious',
        Q = ':cfirst',
        ['<C-q>'] = ':cpfile',
        t = ':tprevious',
        T = ':tfirst',
        ['<C-t>'] = ':ptprevious',
        u = 'URL encode', -- TODO: set as operator for motion command
        x = 'XML encode', -- TODO: set as operator for motion command
        y = { '<NOP>', 'which_key_ignore' },
        ['<Space>'] = 'Add blank line above the cursor',
    },
    [']'] = {
        a = ':next',
        A = ':last',
        b = ':bnext',
        B = ':blast',
        C = { '<NOP>', 'which_key_ignore' },
        e = 'Exchange line with line below',
        f = 'Go to succeeding file in directory',
        l = ':lnext',
        L = ':llast',
        ['<C-l>'] = ':lnfile',
        n = { '<NOP>', 'which_key_ignore' },
        o = {
            name = 'Disable option',
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
        P = { '<NOP>', 'which_key_ignore' },
        q = ':cnext',
        Q = ':clast',
        ['<C-q>'] = ':cnfile',
        t = ':tnext',
        T = ':tlast',
        ['<C-t>'] = ':ptnext',
        u = 'URL decode', -- TODO: set as operator for motion command
        x = 'XML decode', -- TODO: set as operator for motion command
        y = { '<NOP>', 'which_key_ignore' },
        ['<Space>'] = 'Add blank line below the cursor',
    },
    ['y'] = {
        name = 'prefix',
        o = {
            name = 'Toggle option',
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
    ['='] = {
        p = 'Paste below linewise and re-indent',
        P = 'Paste above linewise and re-indent',
        s = { '<NOP>', 'which_key_ignore' },
    },
    ['>s'] = { '<NOP>', 'which_key_ignore' },
    ['<s'] = { '<NOP>', 'which_key_ignore' },
    ['>p'] = { '<NOP>', 'which_key_ignore' },
    ['>P'] = { '<NOP>', 'which_key_ignore' },
    ['<p'] = { '<NOP>', 'which_key_ignore' },
    ['<P'] = { '<NOP>', 'which_key_ignore' },
})
