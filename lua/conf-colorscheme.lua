local M = {}

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

-- Helper function to set global highlights
local function highlight(group_name, group_setting)
    vim.api.nvim_set_hl(0, group_name, group_setting)
end

function M.base16_overwrites()
    local palette = M.get_current_base16_palette()
    if not palette then return end

    require('feline').use_theme(palette)

    -- Line numbers should have the same color than comments
    highlight('LineNr', { fg = palette.base03 })

    -- Set a new color for the vertical split line
    highlight('VertSplit', { fg = palette.base02 })

    -- The default visual selection is pretty bright. Let's darken it a bit
    highlight('Visual', { bg = palette.base01 })

    -- Matching parentheses should have the same color as visual selections
    highlight('MatchParen', { bg = palette.base01 })

    -- Dont show '~' characters to denote the end of the buffer
    highlight('EndOfBuffer', { fg = palette.base00 })

    -- Clear the highlight of cursorline background
    highlight('CursorLine', {})

    -- Disable highlight of the current line number background
    highlight('CursorLineNr', { fg = palette.base05, bold = true })

    -- Highlight folded text like comments
    highlight('Folded', { fg = palette.base03 })

    -- Highlight the foldcolumn like my line numbers
    highlight('FoldColumn', { fg = palette.base03 })

    -- Diagnostic warning in orange
    highlight('DiagnosticWarn', { fg = palette.base09 })

    -- Diagnostic hint in yellow
    highlight('DiagnosticHint', { fg = palette.base0A })

    -- Diagnostic information in blue
    highlight('DiagnosticInfo', { fg = palette.base0D })

    -- Define colors for nvim tree elements
    highlight('NvimTreeGitDirty', { fg = palette.base08 })
    highlight('NvimTreeRootFolder', { fg = palette.base0C })
    highlight('NvimTreeSymlink', { fg = palette.base0A, bold = true })
    highlight('NvimTreeExecFile', { fg = palette.base0B, bold = true })
    highlight('NvimTreeImageFile', { fg = palette.base0E, bold = true })
    highlight('NvimTreeCursorLine', { bg = palette.base01 })
    highlight('NvimTreeNormal', { bg = palette.base00 })
    highlight('NvimTreeEndOfBuffer', { fg = palette.base00 })
    highlight('NvimTreeVertSplit', { fg = palette.base01, bg = palette.base01 })

    -- Clear the default statusline and make it disappear. This is necessary
    -- whenever feline does not overwrite it (e.g. for dashboard)
    highlight('StatusLine', {})

    -- Define colors for my dashboard
    highlight('DashboardHeader', { fg = palette.base0E })
    highlight('DashboardCenter', { fg = palette.base0D })
    highlight('DashboardFooter', { fg = palette.base03 })

    -- Define colors for blank characters. Show blanks with 'set list'.
    highlight('Whitespace', { fg = palette.base01 })

    -- NonText colors the 'eol' character
    highlight('NonText', { fg = palette.base01 })

    -- Indent lines should have the closest color to the background
    highlight('IndentBlanklineChar', { fg = palette.base01 })
    highlight('IndentBlanklineContextChar', { fg = palette.base01 })
    highlight('IndentBlanklineSpaceChar', { fg = palette.base01 })

    -- Nvim-base16 overwrites the telescope highlight groups. Let's get the
    -- defaults back
    highlight('TelescopeSelection', { bg = palette.base01 })
    highlight('TelescopeNormal', { fg = palette.base05, bg = palette.base00 })
    highlight('TelescopePromptNormal', { fg = palette.base05, bg = palette.base00 })
    highlight('TelescopeBorder', { fg = palette.base05, bg = palette.base00 })
    highlight('TelescopePromptBorder', { fg = palette.base05, bg = palette.base00 })
    highlight('TelescopeTitle', { fg = palette.base05, bg = palette.base00 })
    highlight('TelescopePromptTitle', {})
    highlight('TelescopeResultsTitle', {})
    highlight('TelescopePreviewTitle', {})
    highlight('TelescopePromptPrefix', { fg = palette.base08 })

    -- Highlights for completions floating windows
    highlight('CmpItemKind', { fg = palette.base0E }) -- completion kind
    highlight('CmpItemMenu', { fg = palette.base03 }) -- completion source
    highlight('CmpItemAbbrMatch', { fg = palette.base0C })
    highlight('CmpItemAbbrMatchFuzzy', { fg = palette.base0C })
    highlight('PmenuSbar', { bg = palette.base01 }) -- scroll column
    highlight('PmenuThumb', { bg = palette.base02 }) -- scroll bar
end

function M.setup()
    local autocmd = vim.api.nvim_create_autocmd

    -- Whenever the colorscheme changes, apply my overwrites
    autocmd('ColorScheme', {callback = require'conf-colorscheme'.base16_overwrites})

    -- Use the same colorscheme as my terminal
    local scheme = vim.env.BASE16_THEME or 'gruvbox-dark-medium'
    vim.api.nvim_command('colorscheme base16-' .. scheme)
end

return M
