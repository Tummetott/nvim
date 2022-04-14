require('Comment').setup()

-- Add keymappings
local wk = require('which-key')
wk.register({
    ['<C-_>'] = {
        require('Comment.api').toggle_current_linewise,
        'Toggle comment current line'
    }
})
wk.register({
    ['<C-_>'] = {
        require('Comment.api').toggle_current_linewise,
        'Toggle comment current line'
    }
}, { mode = 'i' })
wk.register({
    ['<C-_>'] = {
        'gc',
        'Toggle comment current selection'
    }
}, { mode = 'x', noremap = false })
