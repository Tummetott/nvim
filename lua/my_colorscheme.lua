local M = {}

-- Access modules faster
local cmd = vim.cmd

-- Enable true colors
vim.o.termguicolors = true

-- Turn on highlighting of the cursor line
vim.wo.cursorline = true

-- Get the loaded base16 palette. This function returns nil when no base16
-- colorscheme is loaded
function M.get_current_base16_palette()
    local name = vim.api.nvim_exec('colorscheme', true)
    name = string.gsub(name, 'base16%-', '')
    return require('base16-colorscheme').colorschemes[name]
end

function M.base16_overwrites()
    local palette = M.get_current_base16_palette()

    if not palette then return end

    require('feline').use_theme(palette)

    -- Line numbers should have the same color than comments
    cmd('hi LineNr guifg=' .. palette.base03)

    -- Let's make visual selections more similar to the background
    cmd('hi Visual guibg='.. palette.base01)

    -- Since line numbers are always shown, I don' need '~' characters to
    -- denote blank lines
    cmd 'hi NonText guifg=bg'

    -- Disable highlight of cursorline background
    cmd 'hi CursorLine guibg=NONE'

    -- Disable highlight of the current line number background
    cmd('hi CursorLineNR guibg=NONE guifg=' .. palette.base06)

    -- Don't highlight closed folds
    cmd 'hi Folded guibg=NONE'

    -- Diagnostic warning in orange
    cmd('hi DiagnosticWarn guifg=' .. palette.base09)

    -- Diagnostic hint in the foreground color
    cmd('hi DiagnosticHint guifg=' .. palette.base0A)

    -- Diagnostic information in blue
    cmd('hi DiagnosticInfo guifg=' .. palette.base0D)

    -- Define colors for nvim tree elements
    cmd('hi NvimTreeGitDirty guifg=' .. palette.base08)
    cmd('hi NvimTreeRootFolder guifg=' .. palette.base0C)
    cmd('hi NvimTreeSymlink guifg=' .. palette.base0A)
    cmd('hi NvimTreeExecFile guifg=' .. palette.base0B)
    cmd('hi NvimTreeImageFile guifg=' .. palette.base0E)
    cmd('hi NvimTreeCursorLine guibg=' .. palette.base02)

    -- Make background of nvimtree to grey
    cmd('hi NvimTreeNormal guibg=' .. palette.base01)
    cmd('hi NvimTreeEndOfBuffer guifg=' .. palette.base01)
    cmd('hi NvimTreeVertSplit guibg=' .. palette.base01 .. ' guifg=' .. palette.base00)

    -- This two lines are only relevant for nvimtree since my main statusline
    -- overwrite this highlights
    cmd('hi StatusLine guibg=' .. palette.base01)
    cmd('hi StatusLineNC guibg=' .. palette.base01)

    -- Define colors for my dashboard
    cmd('hi DashboardHeader guifg=' .. palette.base0E)
    cmd('hi DashboardCenter guifg=' .. palette.base0D)
    cmd('hi DashboardFooter guifg=' .. palette.base0E)
end

function M.setup()
    -- Whenever the colorscheme changes, apply my overwrites
    cmd [[autocmd ColorScheme * lua require'my_colorscheme'.base16_overwrites()]]

    -- Use the same colorscheme as my terminal
    local scheme = vim.env.BASE16_THEME or 'gruvbox-dark-medium'
    vim.cmd('colorscheme base16-' .. scheme)
end

return M
