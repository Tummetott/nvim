require('neoscroll').setup({
    -- Exclude <c-e> and <c-y> mapping from default
    mappings = {
        '<C-u>',
        '<C-d>',
        '<C-b>',
        '<C-f>',
        'zt',
        'zz',
        'zb',
    },
})

-- Add labels for which-key
require('which-key').register({
    ['<C-f>'] = 'Scroll down a page',
    ['<C-b>'] = 'Scroll up a page',
    ['<C-d>'] = 'Scroll down half page',
    ['<C-u>'] = 'Scroll up half page',
    ['<C-e>'] = 'Scroll down a line',
    ['<C-y>'] = 'Scroll up a line',
})
