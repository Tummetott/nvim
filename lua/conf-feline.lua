local left_section = {}
local right_section = {}
local special_section = {}

local blue = {
    fg = 'base00',
    bg = 'base0D',
}

local blue_bold = {
    fg = 'base00',
    bg = 'base0D',
    style = 'bold',
}

local blue_inv = {
    fg = 'base0D',
    bg = 'base00',
}

local grey = {
    fg = 'base00',
    bg = 'base02',
}

local grey_inv = {
    fg = 'base02',
    bg = 'base00',
}

local grey_bold = {
    fg = 'base00',
    bg = 'base02',
    style = 'bold',
}

local background = {
    fg = 'base00',
    bg = 'base00',
}

-- This helper function tells me if the current buffer is a documentation file
local function is_documentation()
    local doc = { 'help', 'man' }
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    return vim.tbl_contains(doc, ft)
end

-- Vim Mode
table.insert(left_section, {
    provider = function ()
        local mode = require('feline.providers.vi_mode').get_vim_mode()
        return ' ' .. mode .. ' ' --  
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
        str = 'left_moon',
        hl = function()
            return {
                fg = require('feline.providers.vi_mode').get_mode_color(),
                bg = 'base00',
            }
        end,
    },
    right_sep = {
        str = 'right_moon',
        hl = function ()
            local bg = 'base00'
            if require('feline.providers.git').git_info_exists() then
                bg = 'base02'
            end
            return {
                fg = require('feline.providers.vi_mode').get_mode_color(),
                bg = bg
            }
        end,
    },
    priority = 9,
})

-- Git branch
table.insert(left_section, {
    provider = 'git_branch',
    short_provider = '',
    -- Only show the git branch, when the current file is inside the git repo TODO: do I need this?
    -- enabled = require('feline.providers.git').git_info_exists,
    hl = grey,
    left_sep = {
        str = ' on ',
        hl = grey,
    },
    priority = 5,
})

-- Git added
table.insert(left_section, {
    provider = 'git_diff_added',
    short_provider = '',
    hl = grey,
    priority = 3,
})

-- Git removed
table.insert(left_section, {
    provider = 'git_diff_removed',
    short_provider = '',
    hl = grey,
    priority = 3,
})

-- Git changed
table.insert(left_section, {
    provider = 'git_diff_changed',
    short_provider = '',
    hl = grey,
    priority = 3,
})

-- Closing moon
table.insert(left_section, {
    provider = ' ',
    hl = grey,
    right_sep = {
        str = '',
        hl = grey_inv,
    },
    enabled = require('feline.providers.git').git_info_exists,
})

-- This dummy module fixes the highlighting between the left and the right
-- section, when no file is loaded into vim
table.insert(left_section, {
    hl = background,
})

-- Trailing whitespaces
table.insert(right_section, {
    provider = '  trailing ',
    short_provider = '',
    enabled = function ()
        local line = vim.fn.search('\\s\\+$', 'nwc')
        if line == 0 then return false else return true end
    end,
    hl = grey_inv,
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
    hl = grey_inv,
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
        hl = background,
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
        hl = background,
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
        hl = background,
    },
    priority = 6,
})

-- LSP info
table.insert(right_section, {
    provider = 'diagnostic_info',
    short_provider = '',
    hl = blue_inv,
    right_sep = {
        str = ' ',
        hl = background,
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
    hl = grey_bold,
    left_sep = {
        {
            str = 'left_moon',
            hl = grey_inv,
        },
        {
            str = ' ',
            hl = grey,
        }
    },
    right_sep = {
        str = ' ',
        hl = grey,
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
    hl = grey,
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
    hl = blue,
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
            hl = blue,
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
    hl = blue,
    left_sep = {
        str = ' ',
        hl = blue,
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
    hl = blue,
    priority = 7,
})

-- Closing Moon
table.insert(right_section, {
    provider = ' ',
    hl = blue,
    right_sep = {
        str = 'right_moon',
        hl = blue_inv,
    },
})

-- For all special filetypes and buffer, we only want to show the filetype
table.insert(special_section, {
    provider = function()
        local ft = vim.api.nvim_buf_get_option(0, 'filetype')
        if ft == 'TelescopePrompt' then ft = 'Telescope'
        elseif ft == 'man' then ft = 'Man Page'
        elseif ft == '' then ft = 'Terminal'
        end
        return string.upper(ft)
    end,
    -- Disable it only for the dashboard
    enabled = function()
        return vim.api.nvim_buf_get_option(0, 'filetype') ~= 'alpha'
    end,
    hl = blue_bold,
    left_sep = {
        {
            str = 'left_moon',
            hl = blue_inv,
        },
        {
            str = ' ',
            hl = blue,
        },
    },
    right_sep = {
        {
            str = ' ',
            hl = blue,
        },
        {
            str = 'right_moon',
            hl = blue_inv,
        },
    },
})

-- Since I set the option 'laststatus = 3', I only have one global statusline
-- for all windows. Therefore, I never really have a statusline for an inactive
-- window. However, I use this component for special filetypes/buffer (e.g the
-- help)
local statusline_components = {
    active = {
        left_section,
        right_section,
    },
    inactive = {
        special_section,
    },
}

require('feline').setup({
    components = statusline_components,
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
            '^TelescopePrompt$',
            '^packer$',
            '^help$',
            '^alpha$',
            '^lspinfo$',
            '^man$',
            '^git$',
        },
        buftypes = {
            '^terminal$'
        },
    },
    custom_providers = {
        file_information = function()
            -- Get the full file name
            local filename = vim.api.nvim_buf_get_name(0)

            if filename == '' then
                filename = '[No File]'
            end

            -- Get icon and icon color
            local extension = vim.fn.fnamemodify(filename, ':e')
            local icon_str, icon_color =
                require('nvim-web-devicons').get_icon_color(nil, extension, { default = true })
            local icon = { str = icon_str, hl = { fg = icon_color } }

            -- Special treatment for documentation
            if is_documentation() then
                filename = vim.fn.fnamemodify(filename, ':t')
            end

            -- Special treatment for diff buffers
            local revision = ''
            if vim.wo.diff then
                local gitpath, innerpath, relpath
                if vim.startswith(filename, 'gitsigns://') then
                    _, _, gitpath, innerpath, revision, relpath =
                        filename:find('gitsigns://(.*)%.git/modules/(.*/)([^/]*):(.*)')
                    filename = gitpath .. innerpath .. relpath
                    if revision == ':0' then revision = 'INDEX' end
                    if revision == 'HEAD~' then revision = 'HEAD' end
                elseif vim.startswith(filename, 'fugitive://') then
                    _, _, gitpath, innerpath, revision, relpath =
                        filename:find('fugitive://(.*)%.git/modules/(.*/)/(%x-)/(.*)')
                    filename = gitpath .. innerpath .. relpath
                    if revision == '0' then revision = 'INDEX' end
                elseif vim.startswith(filename, 'diffview://') then
                    _, _, gitpath, revision, relpath =
                        filename:find('diffview://(.*)%.git/([^/]*)/(.*)')
                    if revision == ':0:' then revision = 'INDEX' end
                    filename = gitpath .. relpath
                end
            end

            -- Trim the full file name relative to our cwd
            filename = vim.fn.fnamemodify(filename, ':~:.')

            local modified_icon = ''
            if vim.bo.modified then
                modified_icon = ' ●'
            elseif vim.bo.readonly or not vim.bo.modifiable then
                modified_icon = ' '
            end

            if revision ~= '' then revision = ' ﯩ ' .. revision end

            return string.format(' %s%s%s', filename, revision, modified_icon), icon
        end
    }
})

local gps = require('nvim-gps')

local file_info_comp = {
    left_sep = {
        str = ' ',
        hl = background,
    },
    -- Hide for special filetypes
    enabled = function ()
        local special_files = {
            'DiffviewFiles',
            'DiffviewFileHistory',
            'alpha',
            'NvimTree',
            'git',
        }
        local ft = vim.api.nvim_buf_get_option(0, 'filetype')
        return not vim.tbl_contains(special_files, ft)
    end,
    provider = 'file_information',
    hl = {
        fg = 'base03',
        bg = 'base00',
        style = 'bold',
    },
}

local gps_component = {
    left_sep = {
        str = '  ',
        hl = {
            fg = 'base03',
            bg = 'base00',
            style = 'bold',
        }
    },
    provider = function()
        return gps.get_location()
    end,
    enabled = function()
        return gps.is_available() and not vim.wo.diff
    end,
    hl = {
        fg = 'base03',
        bg = 'base00',
        style = 'bold',
    },
}

local nvimtree_dummy_comp = {
    hl = { bg = 'base01' },
    enabled = function()
        local ft = vim.api.nvim_buf_get_option(0, 'filetype')
        return ft == 'NvimTree'
    end
}

local winbar_components = {
    active = {{
        file_info_comp,
        gps_component,
        nvimtree_dummy_comp,
    }},
    inactive = {{
        file_info_comp,
        nvimtree_dummy_comp,
    }},
}

require('feline').winbar.setup({
    components = winbar_components
})
