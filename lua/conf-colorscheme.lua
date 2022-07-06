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
    return require('colors')[name]
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
    highlight('LineNr', { link = 'Comment' })

    -- Set a new color for the vertical split line
    highlight('WinSeparator', { link = 'Comment' })

    -- The default visual selection is pretty bright. Let's darken it a bit
    highlight('Visual', { bg = palette.base01 })

    -- Matching parentheses should have the same color as visual selections
    highlight('MatchParen', { link = 'Visual' })

    -- When searching, the next match is colored orange and all other matches
    -- are colored grey
    highlight('Search', { fg = palette.base00, bg = palette.base02 })
    highlight('IncSearch', { fg = palette.base00, bg = palette.base09 })

    -- Dont show '~' characters to denote the end of the buffer
    highlight('EndOfBuffer', { fg = palette.base00 })

    -- Due to a bug in nvim, I have to set ctermfg to any value (this setting
    -- is not used with termguicolors anyway) to get rid of the underline in
    -- diff splits
    highlight('CursorLine', { ctermfg = 'white' })

    -- Disable highlight of the current line number background
    highlight('CursorLineNr', { fg = palette.base05, bold = true })

    -- Highlight folded text like comments
    highlight('Folded', { fg = palette.base03 })

    -- Highlight the foldcolumn like my line numbers
    highlight('FoldColumn', { fg = palette.base03 })

    -- Blank characters shown then 'list' is enabled
    highlight('Whitespace', { fg = palette.base01 })

    -- NonText colors the 'eol' character
    highlight('NonText', { link = 'Whitespace' })

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
    highlight('NvimTreeNormal', { bg = palette.base01 })
    highlight('NvimTreeEndOfBuffer', { fg = palette.base01 })
    highlight('NvimTreeWinSeparator', { fg = palette.base01, bg = palette.base01 })

    -- Clear the default statusline and winbar hl-group. This is necessary
    -- whenever feline does not overwrite it (e.g. for the greeter)
    highlight('StatusLine', {})
    highlight('WinBar', {})
    highlight('WinBarNC', {})

    -- Define colors for my dashboard
    highlight('GreeterHeader', { fg = palette.base0D })
    highlight('GreeterCenter', { fg = palette.base03, bold = true })
    highlight('GreeterFooter', { fg = palette.base02 })

    -- Indent lines should have the closest color to the background
    highlight('IndentBlanklineChar', { link = 'Whitespace' })
    highlight('IndentBlanklineContextChar', { link = 'IndentBlanklineChar' })
    highlight('IndentBlanklineSpaceChar', { link = 'IndentBlanklineChar' })

    -- Nvim-base16 overwrites the telescope highlight groups. Let's get the
    -- defaults back
    highlight('TelescopeSelection', { link = 'Visual' })
    highlight('TelescopeNormal', { link = 'Normal' })
    highlight('TelescopePromptNormal', { link = 'TelescopeNormal' })
    highlight('TelescopeBorder', { link = 'TelescopeNormal' })
    highlight('TelescopePromptBorder', { link = 'TelescopeNormal' })
    highlight('TelescopeTitle', { link = 'TelescopeNormal' })
    highlight('TelescopePromptTitle', { link = 'TelescopeTitle' })
    highlight('TelescopeResultsTitle', { link = 'TelescopeTitle' })
    highlight('TelescopePreviewTitle', { link = 'TelescopeTitle' })
    highlight('TelescopePromptPrefix', { link = 'Identifier' })

    -- Highlights for completions floating windows
    highlight('CmpItemKind', { fg = palette.base0E }) -- completion kind
    highlight('CmpItemMenu', { fg = palette.base03 }) -- completion source
    highlight('CmpItemAbbrMatch', { fg = palette.base0C })
    highlight('CmpItemAbbrMatchFuzzy', { fg = palette.base0C })
    highlight('PmenuSbar', { bg = palette.base01 }) -- scroll column
    highlight('PmenuThumb', { bg = palette.base05 }) -- scroll bar

    -- Highlights for lsp document highlight (all occurences of the word under
    -- the cursor)
    highlight('LspReferenceRead', { link = 'Visual' })
    highlight('LspReferenceWrite', { link = 'Visual' })
    highlight('LspReferenceText', {})

    -- Highlight all differences with a slightly different background. When a
    -- line is changed, highighlight the foreground in grey and only highlight
    -- the change
    highlight('DiffAdd', { fg = palette.base03, bg = palette.base01 })
    highlight('DiffDelete', { fg = palette.base01, bg = palette.base00 })
    highlight('DiffChange', { fg = palette.base03, bg = palette.base01 })
    highlight('DiffText', { fg = palette.base0D, bg = palette.base01 })

    -- Color of gitsigns in the sign column
    highlight('GitSignsAdd', { fg = palette.base0B })
    highlight('GitSignsChange', { fg = palette.base0E })

    highlight('BufferCurrent', { fg = palette.base00, bg = palette.base0D })
    highlight('BufferInactive', { fg = palette.base00, bg = palette.base02 })
    highlight('BufferTabpageFill', { bg = palette.base00, fg = palette.base00 })
    highlight('BufferCurrentSign', { link = 'BufferCurrent' })
    highlight('BufferCurrentMod', { link = 'BufferCurrent' })
    highlight('BufferInactiveMod', { link = 'BufferInactive' })
    highlight('BufferInactiveSign', { link = 'BufferInactive' })
    highlight('BufferVisibleMod', { link = 'BufferVisible' })
    highlight('BufferTabpages', { link = 'Function' })

    -- Create a highlight namespace for diff views
    highlight('VisualDiff', { bg = palette.base02 })
end

function M.setup()
    local autocmd = vim.api.nvim_create_autocmd
    local autogroup = vim.api.nvim_create_augroup

    -- Whenever the colorscheme changes, apply my overwrites
    local group = autogroup('Base16_Overwrites', { clear = true })
    autocmd('ColorScheme', {
        callback = require 'conf-colorscheme'.base16_overwrites,
        group = group
    })

    -- Use the same colorscheme as my terminal
    local scheme = vim.env.BASE16_THEME or 'gruvbox-dark-medium'
    vim.api.nvim_command('colorscheme base16-' .. scheme)
end

return M
