local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Remap leader key to space. It must be unmapped first
keymap('n', '<Space>', '<Nop>', opt)
vim.g.mapleader = ' '

-- Use J and K in visual mode to move enitre lines. Indentation is adjusted
-- automatically
keymap('x', 'J', ":move '>+1<CR>gv=gv", opt)
keymap('x', 'K', ":move '<-2<CR>gv=gv", opt)

-- Use CTRL-j and CTRL-k to move a line from within insert mode. Indentation is
-- adjusted automatically
keymap('i', '<C-j>', '<Esc>:move .+1<CR>==<Right>i', opt)
keymap('i', '<C-k>', '<Esc>:move .-2<CR>==<Right>i', opt)

-- Y yanks from the cursor position to the end of the line. The default vim
-- behaviour is just inconsistent
keymap('n', 'Y', 'y$', opt)

-- Y in visual mode copies to system clipboard
keymap('x', 'Y', '"+y', opt)

-- Select perevious pasted text
keymap('n', '<Leader>p', '`[v`]', opt)

-- Use emacs bindings to navigate forward and backward in insert mode
keymap('i', '<C-f>', '<Right>', opt)
keymap('i', '<C-b>', '<Left>', opt)

-- Use emacs bindings to navigate to start of the line in command mode. When
-- silent is used as option, the screen is not redrawn
keymap('c', '<C-a>', '<C-b>', {noremap=true})

-- Use emacs bindings to navigate left and right in command mode. When silent
-- is used as option, the screen is not redrawn
keymap('c', '<C-b>', '<Left>', {noremap=true})
keymap('c', '<C-f>', '<Right>', {noremap=true})

-- The first <CR> after a search disables the highlights. Usefull when
-- hlsearch is enabled
keymap('n', '<CR>', 'v:hlsearch ? ":noh<CR>" : "<CR>"', {noremap=true, expr=true})

-- Disable ex mode. This mode is useless and it's annoying to quit out of it
-- when entered accidentally
keymap('n', 'Q', '<Nop>', opt)
keymap('n', 'gQ', '<Nop>', opt)

-- Press Tab or S-Tab in normal mode to go to next/previous buffer
keymap('n', '<Tab>', ':bnext<CR>', opt)
keymap('n', '<S-Tab>', ':bprevious<CR>', opt)

-- Mapping to clear the quickfix list
keymap('n', '<Leader>cq', '<Cmd>lua vim.fn.setqflist({})<CR>', opt)

-- Turn on/off list chars and indentation lines for all levels, not just the
-- current one. Following the syntax of tpopes plugin 'unimpared'
keymap('n', '[ob', [[<Cmd>lua require'my_functions'.show_blank_chars()<CR>]], opt)
keymap('n', ']ob', [[<Cmd>lua require'my_functions'.hide_blank_chars()<CR>]], opt)
keymap('n', 'yob', [[<Cmd>lua require'my_functions'.toggle_blank_chars()<CR>]], opt)

-- The unimpared plugins toggles cursorline, cursorcolumn or both with a mapping.
-- Since I want to have cursorline enabled at all times to highlight the
-- current linenumber, this mapping does not work for me. That's why I
-- overwride the option to get the same behaviour back
keymap('n', '[oc', [[<Cmd>lua require'my_functions'.enable_cursorline()<CR>]], opt)
keymap('n', ']oc', [[<Cmd>lua require'my_functions'.disable_cursorline()<CR>]], opt)
keymap('n', 'yoc', [[<Cmd>lua require'my_functions'.toggle_cursorline()<CR>]], opt)
keymap('n', '[ox', [[<Cmd>lua require'my_functions'.enable_cursorcross()<CR>]], opt)
keymap('n', ']ox', [[<Cmd>lua require'my_functions'.disable_cursorcross()<CR>]], opt)
keymap('n', 'yox', [[<Cmd>lua require'my_functions'.toggle_cursorcross()<CR>]], opt)

-- Jump to next/previous trailing whitespace
keymap('n', ']w', [[<Cmd>lua vim.fn.search('\\s\\+$', 'w')<CR>]], opt)
keymap('n', '[w', [[<Cmd>lua vim.fn.search('\\s\\+$', 'bw')<CR>]], opt)

-- The shortcut to exit from a vim-termianl is weird. Let's make a new one
keymap('t', '<C-x>', '<C-\\><C-n>', opt)
