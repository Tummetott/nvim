-- Display line numbers
vim.wo.number = true

-- Don't show tabline
vim.o.showtabline = 0

-- Disable startup message
vim.o.shortmess = vim.o.shortmess .. 'I'

-- Don't display filenames as the statusline plugin already shows that
vim.o.shortmess = vim.o.shortmess .. 'F'

-- Don't display mode changes as the statusline plugin already shows that
vim.o.showmode = false

-- Don't show line and column number since my statusline already shows this
vim.o.ruler = false

-- Enable modeline
vim.o.modeline = true

-- Enable mouse support. This let's you scroll, jump, select, resize windows and
-- much more stuff. Also don't copy line numbers with the mouse
vim.o.mouse = 'a'

-- Enable true colors
vim.o.termguicolors = true

-- Case insensitive search, except when using capital letters
vim.o.smartcase = true
vim.o.ignorecase = true

-- Don't highlight all my matches
vim.o.hlsearch = false

-- Also highlight all matches while tying a regex in ex-mode
vim.o.inccommand = 'nosplit'

-- Always leave some lines below and above the cursor when scrolling
vim.o.scrolloff = 5

-- Hide buffers instead of closing them. This means that you can have unwritten
-- changes to a file and open a new file, without being forced to write or undo
-- your changes first
vim.o.hidden = true

-- Disable swap files
vim.bo.swapfile = false

-- Make undo persistent, even after restart
vim.o.undofile = true
vim.bo.undofile = true

-- With how many whitespace is a '\t' char displayed
vim.o.tabstop = 4
vim.bo.tabstop = 4

-- How many whitespaces has a level of indentation (used in shifts, auto
-- formatting). If set to zero, it will default to the value of tabstop
vim.o.shiftwidth = 0
vim.bo.shiftwidth = 0

-- Expand tabs to spaces
vim.o.expandtab = true
vim.bo.expandtab = true

-- Indentation is dependending on the programming language
vim.o.smartindent = true
vim.bo.smartindent = true

-- New splits will be right and below instead of left and above
vim.o.splitbelow = true
vim.o.splitright = true

-- Diffsplits are always shown in a vertical split and foldcolumn is always one
-- character wide
vim.o.diffopt = vim.o.diffopt .. ',vertical,foldcolumn:2'

-- When doing 'cw' on a word, also delete the whitespace (Remove '_' option from
-- cpoptions)
vim.o.cpoptions = string.gsub(vim.o.cpoptions, '_', '')

-- Hide the last entered ex command
vim.cmd('autocmd CmdlineLeave * echom "" ')

-- Hide line numbers in terminal mode
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")

-- Automatically go in insert mode then opening a terminal
vim.cmd("autocmd TermOpen * startinsert")

-- The fill character of folds is a whitespace
vim.o.fillchars = "fold: ,diff: "

-- Set chars for blanks. You can enable them with 'set list'
vim.o.listchars = 'space:⋅,tab:——▸,eol:↴'

-- Show foldcolumn (with width = 2) when there are active folds
vim.wo.foldcolumn = "auto:3"

-- Show signs inside the number column
vim.wo.signcolumn = "number"

-- Only safe folds and cursor position when executing :mkview
vim.o.viewoptions = "cursor,folds"

-- Convenience function to print lua tables
function P(o)
    print(require('my_functions').dump(o))
end
