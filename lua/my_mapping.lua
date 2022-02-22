local keymap = vim.api.nvim_set_keymap

-- Remap leader key to SPACE. It must be unmapped first
keymap('n', '<SPACE>', '<NOP>', { noremap=true })
vim.g.mapleader = ' '

-- Use J and K in visual mode to move enitre lines
keymap('x', 'J', ":move '>+1<CR>gv=gv", { noremap=true })
keymap('x', 'K', ":move '<-2<CR>gv=gv", { noremap=true })

-- Use CTRL-j and CTRL-k to move a line from within insert mode
keymap('i', '<C-j>', '<ESC>:move .+1<CR>==', { noremap=true })
keymap('i', '<C-k>', '<ESC>:move .-2<CR>==', { noremap=true })

-- Y yanks from the cursor position to the end of the line
keymap('n', 'Y', 'y$', { noremap=true })

-- Y in visual mode copies to system clipboard
keymap("x", "Y", '"+y', { noremap=true })

-- Select pasted text
keymap('n', '<LEADER>v', '`[v`]', { noremap=true })

-- Use EMACS bindings to navigate forward and backward in insert mode
keymap('i', '<C-f>', '<right>', { noremap=true })
keymap('i', '<C-b>', '<left>', { noremap=true })

-- Use EMACS bindings to navigate to start of the line in command mode
keymap('c', '<C-a>', '<C-b>', { noremap=true })

-- Use EMACS bindings to navigate left and right in command mode
keymap('c', '<C-b>', '<left>', { noremap=true })
keymap('c', '<C-f>', '<right>', { noremap=true })

-- The first ENTER after a search disables the highlights. Usefull when
-- 'hlsearch' is enabled
keymap('n', '<CR>', 'v:hlsearch ? ":noh<CR>" : "<CR>"', { noremap=true, expr=true })

-- Press LEADER-n or LEADER-p in normal mode to go to next / previous buffer
-- keymap('n', '<LEADER>n', ':bnext<CR>', { noremap=true })
-- keymap('n', '<LEADER>p', ':bprevious<CR>', { noremap=true })

local opt = {noremap = true, silent = true}

-- Mapping to clear the quickfix list
keymap('n', '<LEADER>cq', '<CMD>lua vim.fn.setqflist({})<CR>', opt)

-- Turn on/off list chars and indentation lines for all levels, not just the
-- current one. Following the syntax of tpopes plugin 'unimpared'
keymap('n', '[ob', '<CMD>lua require"my_functions".show_blank_chars()<CR>', opt)
keymap('n', ']ob', '<CMD>lua require"my_functions".hide_blank_chars()<CR>', opt)
keymap('n', 'yob', '<CMD>lua require"my_functions".toggle_blank_chars()<CR>', opt)

-- The unimpared plugins toggles cursorline, column or both with a mapping.
-- Since I want to have cursorline enabled at all times to highlight the
-- current linenumber, this mapping does not work for me. That's why I
-- overwride the option to get the same behaviour back
keymap('n', '[oc', '<CMD>lua require"my_functions".enable_cursorline()<CR>', opt)
keymap('n', ']oc', '<CMD>lua require"my_functions".disable_cursorline()<CR>', opt)
keymap('n', 'yoc', '<CMD>lua require"my_functions".toggle_cursorline()<CR>', opt)

keymap('n', '[ox', '<CMD>lua require"my_functions".enable_cursorcross()<CR>', opt)
keymap('n', ']ox', '<CMD>lua require"my_functions".disable_cursorcross()<CR>', opt)
keymap('n', 'yox', '<CMD>lua require"my_functions".toggle_cursorcross()<CR>', opt)

-- Jump to next trailing whitespace
keymap('n', '<LEADER>tn', '<CMD>lua require("my_functions").jump_to_next_trailing_whitespace()<CR>', opt)
