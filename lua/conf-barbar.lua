local wk = require('which-key')

wk.register({
    ['bb'] = {
        '<Cmd>BufferPick<CR>',
        'Jump-to-buffer mode',
    }
}, { prefix = '<Leader>' })

vim.g.bufferline = {
    auto_hide = true,
    icon_separator_active = ' ',
    insert_at_end = false,
}
