require('Navigator').setup()

require('which-key').register({
    ['<C-h>'] = {
        require('Navigator').left,
        'Go to left pane',
    },
    ['<C-l>'] = {
        require('Navigator').right,
        'Go to right pane',
    },
    ['<C-k>'] = {
        require('Navigator').up,
        'Go to upper pane',
    },
    ['<C-j>'] = {
        require('Navigator').down,
        'Go to lower pane',
    },
})
