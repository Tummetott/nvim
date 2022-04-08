local M = {}
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
    cmd('hi! link LineNr Comment')

    -- Set a new color for the vertical split line
    cmd('hi VertSplit guifg=' .. palette.base02)

    -- The default visual selection color is pretty bright. Let's darken it a
    -- bit
    cmd('hi Visual guibg='.. palette.base01)

    -- Link our matching parentheses to our visual selection color
    cmd('hi! link MatchParen Visual')

    -- Since line numbers are always shown, I don' need '~' characters to
    -- denote blank lines
    cmd 'hi EndOfBuffer guifg=bg'

    -- Disable highlight of cursorline background
    cmd 'hi CursorLine guibg=NONE'

    -- Disable highlight of the current line number background
    cmd('hi CursorLineNR guibg=NONE guifg=' .. palette.base05)

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

    -- Define colors for blank characters. You show blanks with 'set list'.
    -- NonText colors the 'eol' character
    cmd('hi Whitespace guifg=' .. palette.base01)
    cmd('hi! link NonText Whitespace')

    -- Link all symbols showing indent lines to my whitespace color
    cmd('hi! link IndentBlanklineChar Whitespace')
    cmd('hi! link IndentBlanklineContextChar Whitespace')
    cmd('hi! link IndentBlanklineSpaceChar Whitespace')

    -- nvim-base16 overwrites the telescope highlight groups. Let's get the
    -- defaults back
    cmd('hi! link TelescopeSelection        Visual')
    cmd('hi! link TelescopeNormal           Normal')
    cmd('hi! link TelescopePromptNormal     TelescopeNormal')
    cmd('hi! link TelescopeBorder           TelescopeNormal')
    cmd('hi! link TelescopePromptBorder     TelescopeBorder')
    cmd('hi! link TelescopeTitle            TelescopeBorder')
    cmd('hi! link TelescopePromptTitle      TelescopeTitle')
    cmd('hi! link TelescopeResultsTitle     TelescopeTitle')
    cmd('hi! link TelescopePreviewTitle     TelescopeTitle')
    cmd('hi! link TelescopePromptPrefix     Identifier')

    -- Highlight icon which shows the kind of completion
    cmd('hi CmpItemKind guifg=' .. palette.base0E)

    -- Highlight the completion source
    cmd('hi CmpItemMenu guifg=' .. palette.base03)

    -- Highlight the match and the fuzzy match
    cmd('hi CmpItemAbbrMatchFuzzy guifg=' .. palette.base0C)
    cmd('hi CmpItemAbbrMatch guifg=' .. palette.base0C)

    -- Highlight the scroll bar of completion windows and docs
    cmd('hi PmenuSbar guibg=' .. palette.base01)
    cmd('hi PmenuThumb guibg=' .. palette.base02)
end

function M.setup()
    -- Whenever the colorscheme changes, apply my overwrites
    cmd [[autocmd ColorScheme * lua require'my_colorscheme'.base16_overwrites()]]

    -- Use the same colorscheme as my terminal
    local scheme = vim.env.BASE16_THEME or 'gruvbox-dark-medium'
    vim.cmd('colorscheme base16-' .. scheme)
end

return M
