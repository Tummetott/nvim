local map = vim.keymap.set

-- Remap leader key to space. It must be unmapped first
map('n', '<Space>', '<Nop>')
vim.g.mapleader = ' '

-- Use J and K in visual mode to move enitre lines. Indentation is adjusted
-- automatically
map('x', 'J', ":move '>+1<CR>gv=gv")
map('x', 'K', ":move '<-2<CR>gv=gv")

-- Use CTRL-j and CTRL-k to move a line from within insert mode. Indentation is
-- adjusted automatically
map('i', '<C-j>', '<Esc>:move .+1<CR>==<Right>i')
map('i', '<C-k>', '<Esc>:move .-2<CR>==<Right>i')

-- Y yanks from the cursor position to the end of the line. The default vim
-- behaviour is just inconsistent
map('n', 'Y', 'y$')

-- Y in visual mode copies to system clipboard
map('x', 'Y', '"+y')

-- Select perevious pasted text
map('n', '<Leader>v', '`[v`]')

-- Use emacs bindings to navigate forward and backward in insert mode
map('i', '<C-f>', '<Right>')
map('i', '<C-b>', '<Left>')

-- Use emacs bindings to navigate to start of the line in command mode. When
-- silent is used as option, the screen is not redrawn
map('c', '<C-a>', '<C-b>')

-- Use emacs bindings to navigate left and right in command mode. When silent
-- is used as option, the screen is not redrawn
map('c', '<C-f>', '<Right>')
map('c', '<C-b>', '<Left>')

-- The first <CR> after a search disables the highlights. Usefull when
-- hlsearch is enabled
map('n', '<CR>', 'v:hlsearch ? "<Cmd>noh<CR>" : "<CR>"', {expr = true})

-- Disable ex mode. This mode is useless and it's annoying to quit out of it
-- when entered accidentally
map('n', 'Q', '<Nop>')
map('n', 'gQ', '<Nop>')

-- Press Tab or S-Tab in normal mode to go to next/previous buffer
-- map('n', '<Tab>', '<Cmd>bnext<CR>')
-- map('n', '<S-Tab>', '<Cmd>bprevious<CR>')

-- Mapping to clear the quickfix list
map('n', '<Leader>cq', function() vim.fn.setqflist({}) end)

-- Turn on/off list chars and indentation lines for all levels, not just the
-- current one. Following the syntax of tpopes plugin 'unimpared'
map('n', '[ob', require'utils/functions'.show_blank_chars)
map('n', ']ob', require'utils/functions'.hide_blank_chars)
map('n', 'yob', require'utils/functions'.toggle_blank_chars)

-- The unimpared plugins toggles cursorline, cursorcolumn or both with a mapping.
-- Since I want to have cursorline enabled at all times to highlight the
-- current linenumber, this mapping does not work for me. That's why I
-- overwride the option to get the same behaviour back
map('n', '[oc', require'utils/functions'.enable_cursorline)
map('n', ']oc', require'utils/functions'.disable_cursorline)
map('n', 'yoc', require'utils/functions'.toggle_cursorline)
map('n', '[ox', require'utils/functions'.enable_cursorcross)
map('n', ']ox', require'utils/functions'.disable_cursorcross)
map('n', 'yox', require'utils/functions'.toggle_cursorcross)

-- Jump to next/previous trailing whitespace
map('n', ']w', function() vim.fn.search('\\s\\+$', 'w') end)
map('n', '[w', function() vim.fn.search('\\s\\+$', 'bw') end)

-- The shortcut to exit from a vim-termianl is weird. Let's make a new one
map('t', '<C-x>', '<C-\\><C-n>')
