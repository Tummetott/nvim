-- Access modules faster
local g = vim.g

-- This option shows indent markers when folders are open
g.nvim_tree_indent_markers = 0

-- enable file highlight for git attributes
g.nvim_tree_git_hl = 1

-- Reduce file name to be relative to the home directory
g.nvim_tree_root_folder_modifier = ':~'

-- List of filenames that gets highlighted with NvimTreeSpecialFile
g.nvim_tree_special_files = {}

-- Show all kinds of icons
g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1
}

-- Define icons
g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        symlink = "",
        symlink_open = "",
        empty = "",
        empty_open = "",
    },
    lsp = {
        error = "",
        warning = "",
        hint = "",
        info = "ﯦ",
    }
}

require'nvim-tree'.setup {
    disable_netrw       = true,
    -- When netrw is opened, open nvim-tree instead
    hijack_netrw        = true,
    -- Don't open nvim-tree at startup
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    -- Closes neovim automatically when the tree is the last window in the view
    auto_close          = true,
    -- Don't open the tree when opening a new tab if the tree wasn't previously opened
    open_on_tab         = false,
    -- Hijacks new directory buffers when they are opened
    update_to_buf_dir   = {
        enable = true,
        -- allow to open the tree if it was previously closed
        auto_open = true,
    },
    -- Hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor       = true,
    update_cwd          = true,
    -- Show lsp diagnostics in the signcolumn
    diagnostics = {
        enable = false,
        icons = {
            hint = "ﯦ",
            info = "",
            warning = "",
            error = "",
        }
    },
    -- Update the focused file on 'BufEnter', uncollapses the folders
    -- recursively until it finds the file
    update_focused_file = {
        enable      = true,
        -- Update the root directory of the tree to the one of the folder
        -- containing the file if the file is not under the current root
        -- directory
        update_cwd  = false,
        ignore_list = {}
    },
    view = {
        width = 30,
        height = 30,
        side = 'left',
        auto_resize = false,
    },
    filters = {
        -- Don't hide dotfiles
        dotfiles = false,
        custom = { '.git', 'node_modules', '.cache' }
    },
    git = {
        -- Enable git integration, dirty files are collored red etc..
        enable = true,
        -- Ignores files based on .gitignore
        ignore = true,
    },
    actions = {
        open_file = {
            -- Close the tree when opening a file
            quit_on_open = true,
        },
    },
}

local keymap = vim.api.nvim_set_keymap

-- Toggle nvim-tree with CTRL-n
keymap( 'n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
