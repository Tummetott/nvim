local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- Remap leader key to space. It must be unmapped first
map('n', '<Space>', '<Nop>', opt)
vim.g.mapleader = ' '

-- Use J and K in visual mode to move enitre lines. Indentation is adjusted
-- automatically
map('x', 'J', ":move '>+1<CR>gv=gv", opt)
map('x', 'K', ":move '<-2<CR>gv=gv", opt)

-- Use CTRL-j and CTRL-k to move a line from within insert mode. Indentation is
-- adjusted automatically
map('i', '<C-j>', '<Esc>:move .+1<CR>==<Right>i', opt)
map('i', '<C-k>', '<Esc>:move .-2<CR>==<Right>i', opt)

-- Y yanks from the cursor position to the end of the line. The default vim
-- behaviour is just inconsistent
map('n', 'Y', 'y$', opt)

-- Y in visual mode copies to system clipboard
map('x', 'Y', '"+y', opt)

-- Select perevious pasted text
map('n', '<Leader>p', '`[v`]', opt)

-- Use emacs bindings to navigate forward and backward in insert mode
map('i', '<C-f>', '<Right>', opt)
map('i', '<C-b>', '<Left>', opt)

-- Use emacs bindings to navigate to start of the line in command mode. When
-- silent is used as option, the screen is not redrawn
map('c', '<C-a>', '<C-b>', {noremap=true})

-- Use emacs bindings to navigate left and right in command mode. When silent
-- is used as option, the screen is not redrawn
map('c', '<C-b>', '<Left>', {noremap=true})
map('c', '<C-f>', '<Right>', {noremap=true})

-- The first <CR> after a search disables the highlights. Usefull when
-- hlsearch is enabled
map('n', '<CR>', 'v:hlsearch ? "<Cmd>noh<CR>" : "<CR>"', {noremap=true, expr=true})

-- Disable ex mode. This mode is useless and it's annoying to quit out of it
-- when entered accidentally
map('n', 'Q', '<Nop>', opt)
map('n', 'gQ', '<Nop>', opt)

-- Press Tab or S-Tab in normal mode to go to next/previous buffer
-- map('n', '<Tab>', '<Cmd>bnext<CR>', opt)
-- map('n', '<S-Tab>', '<Cmd>bprevious<CR>', opt)

-- Mapping to clear the quickfix list
map('n', '<Leader>cq', function() vim.fn.setqflist({}) end, opt)

-- Turn on/off list chars and indentation lines for all levels, not just the
-- current one. Following the syntax of tpopes plugin 'unimpared'
map('n', '[ob', require'my_functions'.show_blank_chars, opt)
map('n', ']ob', require'my_functions'.hide_blank_chars, opt)
map('n', 'yob', require'my_functions'.toggle_blank_chars, opt)

-- The unimpared plugins toggles cursorline, cursorcolumn or both with a mapping.
-- Since I want to have cursorline enabled at all times to highlight the
-- current linenumber, this mapping does not work for me. That's why I
-- overwride the option to get the same behaviour back
map('n', '[oc', require'my_functions'.enable_cursorline, opt)
map('n', ']oc', require'my_functions'.disable_cursorline, opt)
map('n', 'yoc', require'my_functions'.toggle_cursorline, opt)
map('n', '[ox', require'my_functions'.enable_cursorcross, opt)
map('n', ']ox', require'my_functions'.disable_cursorcross, opt)
map('n', 'yox', require'my_functions'.toggle_cursorcross, opt)

-- Jump to next/previous trailing whitespace
map('n', ']w', function() vim.fn.search('\\s\\+$', 'w') end, opt)
map('n', '[w', function() vim.fn.search('\\s\\+$', 'bw') end, opt)

-- The shortcut to exit from a vim-termianl is weird. Let's make a new one
map('t', '<C-x>', '<C-\\><C-n>', opt)
