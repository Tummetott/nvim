local autocmd = vim.api.nvim_create_autocmd

-- Display line numbers
vim.opt.number = true

-- Use relative numbers
vim.opt.relativenumber = true

-- TODO: investigate if 'auto:1' or 'number'
vim.opt.signcolumn = 'auto:1'

-- Only show tabline if there are at least two tab pages
vim.opt.showtabline = 1

-- Disable startup message
vim.opt.shortmess:append('I')

-- When writing a file, show verbose output for number of lines / bytes written
vim.opt.shortmess:remove('l')

-- Only show one global statusline, independent of the number of windows
vim.opt.laststatus = 3

-- Don't display mode changes as the statusline plugin already shows that
vim.opt.showmode = false

-- With a modeline command, you can e.g. define the filetype of a textfile
-- explicitly)
vim.opt.modeline = true

-- Enable mouse support for all modes. This let's you scroll, jump, select,
-- resize windows etc.
vim.opt.mouse = 'a'

-- Enable true colors
vim.opt.termguicolors = true

-- Case insensitive search, except when using capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Don't highlight all my matches
vim.opt.hlsearch = false

-- Always leave some lines below and above the cursor when scrolling
vim.opt.scrolloff = 5

-- Disable swap files
vim.opt.swapfile = false

-- Make undo persistent, even after restart
vim.opt.undofile = true

-- With how many whitespace is a '\t' char displayed
vim.opt.tabstop = 4

-- How many whitespaces has a level of indentation (used in shifts, auto
-- formatting). If set to zero, it will default to the value of tabstop
vim.opt.shiftwidth = 0

-- Expand tabs to spaces
vim.opt.expandtab = true

-- Indentation is dependending on the programming language. This is probably
-- overwritten by treesitter
vim.opt.smartindent = true

-- New splits will be right and below instead of left and above
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Start diff mode with vertical splits
vim.opt.diffopt:append('vertical')

-- When doing 'cw' on a word, also delete the whitespace after the word
vim.opt.cpoptions:remove('_')

-- The fill character of folds is a whitespace. TODO: do I also want a
-- whitespace for deleted lines in diffs?
vim.opt.fillchars = { fold = ' ', diff = ' ' }

-- Set characters for blanks. Enable them with 'set list'
vim.opt.listchars = { space = '⋅', tab = '——▸', eol = '↴' }

-- Show foldcolumn when there are active folds. Show maximal 4 folds, then
-- display it in numbers
vim.opt.foldcolumn = 'auto:4'

-- Don't save the current directory when saving a view with :mkview
vim.opt.viewoptions:remove('curdir')

-- Hide the last entered ex command
autocmd('CmdlineLeave', { command = 'echo ""' })

-- Hide line numbers in terminal mode and start in insert mode
autocmd('TermOpen', {
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.api.nvim_command('startinsert')
    end
})

-- Convenience function to print lua tables. Used for debugging
P = vim.pretty_print
