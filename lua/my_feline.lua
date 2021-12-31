local left_section = {}
local right_section = {}

-- Vim Mode
table.insert(left_section, {
    provider = function ()
        local mode = require('feline.providers.vi_mode').get_vim_mode()
        return ' ' .. mode
    end,
    short_provider = ' ',
    hl = function ()
        return {
            fg = 'base00',
            bg = require('feline.providers.vi_mode').get_mode_color(),
            style = 'bold'
        }
    end,
    left_sep = {
        {
            str = 'left_moon',
            hl = function()
                return {
                    fg = require('feline.providers.vi_mode').get_mode_color(),
                    bg = 'base00',
                }
            end,
        },
    },
    right_sep = {
        {
            str = ' ',
            hl = function()
                return {
                    fg = 'base00',
                    bg = require('feline.providers.vi_mode').get_mode_color(),
                }
            end,
        },
        {
            str = 'right_moon',
            hl = function ()
                local bg = 'base00'
                -- If a filename exists, color the background in grey
                if vim.fn.expand('%:t') ~= '' then
                    bg = 'base02'
                end
                return {
                    fg = require('feline.providers.vi_mode').get_mode_color(),
                    bg = bg
                }
            end,
        },
    },
    priority = 9,
})

-- File information
table.insert(left_section, {
    provider = {
        name = 'file_info',
        opts = {
            file_modified_icon = '',
            file_readonly_icon = '',
            type = 'relative',
        },
    },
    short_provider = {
        name = 'file_info',
        opts = {
            file_modified_icon = '',
            file_readonly_icon = '',
            type = 'base-only',
        },
    },
    -- Only show filepath when a filename exists
    enabled = function ()
        if vim.fn.expand('%:t') ~= '' then return true end
    end,
    icon = '',
    hl = {
        fg = 'base00',
        bg = 'base02',
        style = 'bold'
    },
    priority = 2,
})

-- Git branch
table.insert(left_section, {
    provider = 'git_branch',
    short_provider = '',
    -- Only show the git branch, when the current file is inside the git repo
    enabled = function ()
        local path = vim.fn.expand('%:p')
        local cwd = vim.fn.getcwd()
        if path:find(cwd) ~= nil then return true end
    end,
    hl = {
        fg = 'base00',
        bg = 'base02',
    },
    left_sep = {
        str = ' on ',
        hl = {
            fg = 'base00',
            bg = 'base02',
        },
    },
    priority = 5,
})

-- Git added
table.insert(left_section, {
    provider = 'git_diff_added',
    short_provider = '',
    hl = {
        fg = 'base00',
        bg = 'base02',
    },
    priority = 3,
})

-- Git removed
table.insert(left_section, {
    provider = 'git_diff_removed',
    short_provider = '',
    hl = {
        fg = 'base00',
        bg = 'base02',
    },
    priority = 3,
})

-- Git changed
table.insert(left_section, {
    provider = 'git_diff_changed',
    short_provider = '',
    hl = {
        fg = 'base00',
        bg = 'base02',
    },
    priority = 3,
})

-- Closing moon
table.insert(left_section, {
    provider = ' ',
    hl = {
        fg = 'base00',
        bg = 'base02',
    },
    right_sep = {
        str = '',
        hl = {
            fg = 'base02',
            bg = 'base00',
        }
    },
    enabled = function ()
        if vim.fn.expand('%:t') ~= '' then return true end
    end,
})

-- This dummy module fixes the highlighting between the left and the right
-- section, when no file is loaded into vim
table.insert(left_section, {
    hl = {
        fg = 'base00',
        bg = 'base00',
    }
})

-- Trailing whitespaces
table.insert(right_section, {
    provider = '  trailing ',
    short_provider = '',
    enabled = function ()
        local line = vim.fn.search('\\s\\+$', 'nwc')
        if line == 0 then return false else return true end
    end,
    hl = {
        fg = 'base02',
        bg = 'base00'
    },
    priority = 1,
})

-- Mixed indent
table.insert(right_section, {
    provider = '  mixed-indent ',
    short_provider = '',
    enabled = function ()
        local spaces = vim.fn.search('^\t* \t*', 'nwc') ~= 0
        local tabs = vim.fn.search('^ *\t *', 'nwc') ~= 0
        return spaces and tabs
    end,
    hl = {
        fg = 'base02',
        bg = 'base00'
    },
    priority = 1,
})

-- LSP error
table.insert(right_section, {
    provider = 'diagnostic_errors',
    short_provider = '',
    hl = {
        fg = 'base08',
        bg = 'base00',
    },
    right_sep = {
        str = ' ',
        hl = {
            fg = 'base00',
            bg = 'base00',
        },
    },
    priority = 6,
})

-- LSP warning
table.insert(right_section, {
    provider = 'diagnostic_warnings',
    short_provider = '',
    hl = {
        fg = 'base09',
        bg = 'base00',
    },
    right_sep = {
        str = ' ',
        hl = {
            fg = 'base00',
            bg = 'base00',
        },
    },
    priority = 6,
})

-- LSP hint
table.insert(right_section, {
    provider = 'diagnostic_hints',
    short_provider = '',
    hl = {
        fg = 'base0A',
        bg = 'base00',
    },
    right_sep = {
        str = ' ',
        hl = {
            fg = 'base00',
            bg = 'base00',
        },
    },
    priority = 6,
})

-- LSP info
table.insert(right_section, {
    provider = 'diagnostic_info',
    short_provider = '',
    hl = {
        fg = 'base0D',
        bg = 'base00',
    },
    right_sep = {
        str = ' ',
        hl = {
            fg = 'base00',
            bg = 'base00',
        },
    },
    priority = 6,
})

-- Filetype
table.insert(right_section, {
    provider = function ()
        local filename = vim.api.nvim_buf_get_name(0)
        local filetype = vim.bo.filetype
        local opts = { default = true }
        local icon, _ = require("nvim-web-devicons").get_icon(filename, filetype, opts)
        if filetype == '' then filetype = 'UNKNOWN' end
        if filename ~= '' then
            return icon .. ' ' .. filetype:upper()
        else return '' end
    end,
    hl = {
        fg = 'base00',
        bg = 'base02',
        style = 'bold',
    },
    left_sep = {
        {
            str = 'left_moon',
            hl = {
                fg = 'base02',
                bg = 'base00',
            },
        },
        {
            str = ' ',
            hl = {
                fg = 'base00',
                bg = 'base02',
            },
        }
    },
    right_sep = {
        str = ' ',
        hl = {
            fg = 'base00',
            bg = 'base02',
        },
    },
})

-- Conda environment
table.insert(right_section, {
    provider = function ()
        local env = os.getenv('CONDA_PROMPT_MODIFIER')
        if env then
            env = string.gsub(env, '%s*%(', '')
            env = string.gsub(env, '%)%s*', '')
            return 'in  ' .. env .. ' '
        end
        return ''
    end,
    short_provider = '',
    hl = {
        fg = 'base00',
        bg = 'base02',
    },
    priority = 4,
})

-- Scroll progress
table.insert(right_section, {
    provider = function ()
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        if curr_line == 1 then
            return "Top"
        elseif curr_line == lines then
            return "Bot"
        else
            return string.format('%d%%%%', math.ceil(curr_line / lines * 99))
        end
    end,
    hl = {
        fg = 'base00',
        bg = 'base0D',
    },
    left_sep = {
        {
            str = 'left_moon',
            hl = function ()
                local bg = 'base00'
                if vim.api.nvim_buf_get_name(0) ~= '' then
                    bg = 'base02'
                end
                return {
                    fg = 'base0D',
                    bg = bg
                }
            end,
        },
        {
            str = ' ',
            hl = {
                fg = 'base00',
                bg = 'base0D',
            },
        }
    }
})

-- Line number / column number
table.insert(right_section, {
    provider = function ()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        local lines = vim.fn.line('$')
        local cols = vim.fn.col('$')
        return string.format(' %d/%d  %d/%d', line, lines, col, cols)
    end,
    short_provider = '',
    hl = {
        fg = 'base00',
        bg = 'base0D',
    },
    left_sep = {
        str = ' ',
        hl = {
            fg = 'base00',
            bg = 'base0D',
        },
    },
    priority = 8,
})

-- LSP active information
table.insert(right_section, {
    provider = function ()
        if require('feline.providers.lsp').is_lsp_attached() then
            return ' '
        else
            return ' '
        end
    end,
    short_provider = '',
    hl = {
        fg = 'base00',
        bg = 'base0D',
    },
    priority = 7,
})

-- Closing Moon
table.insert(right_section, {
    provider = ' ',
    hl = {
        fg = 'base00',
        bg = 'base0D',
    },
    right_sep = {
        str = 'right_moon',
        hl = {
            fg = 'base0D',
            bg = 'base00',
        },
    },
})

-- The statusline consists of two components. The active component is only
-- shown in active windows. The inactive component is only shown for filetypes
-- and buffertypes defined in the 'force_inactive' table of the setup function.
-- The statusline of all other inative windows not defined in the
-- 'force_inactive' table are highlighted based on the 'StatusLine' and
-- 'StatusLineNC' highlight group
local components = {
    active = {
        left_section,
        right_section,
    },
    -- Highlight table in segment in section in inactive table - three braces :)
    inactive = {{{
        hl = function()
            if vim.bo.filetype == 'dashboard' then
                return { fg = 'base00', bg = 'base00', }
            else
                return { fg = 'base01', bg = 'base01', }
            end
        end,
    }}},
}

require('feline').setup({
    components = components,
    separators = {
        ['left_moon'] = '',
        ['right_moon'] = '',
    },
    vi_mode_colors = {
        ['NORMAL'] = 'base0D',
        ['INSERT'] = 'base0C',
        ['COMMAND'] = 'base0E',
        ['VISUAL'] = 'base09',
        ['LINES'] = 'base09',
        ['BLOCK'] = 'base09',
        ['REPLACE'] = 'base08',
        ['ENTER'] = 'base0E',
        ['TERM'] = 'base0E',
    },
    force_inactive = {
        filetypes = {
            '^NvimTree$',
            '^packer$',
            '^help$',
            '^dashboard$'
        },
        buftypes = {
            '^terminal$'
        },
    },
})
