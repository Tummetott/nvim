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

-- The first ENTER after a search disables the highlights. Usefull when 'hlsearch' is enabled
keymap('n', '<CR>', 'v:hlsearch ? ":noh<CR>" : "<CR>"', { noremap=true, expr=true })

-- Press LEADER-n or LEADER-p in normal mode to go to next / previous buffer
-- keymap('n', '<LEADER>n', ':bnext<CR>', { noremap=true })
-- keymap('n', '<LEADER>p', ':bprevious<CR>', { noremap=true })

-- Jump to next trailing whitespace
local opt = {noremap = true, silent = true}
keymap('n', '<LEADER>tn', '<CMD>lua require("utils/utils").jump_to_next_trailing_whitespace()<CR>', opt)
