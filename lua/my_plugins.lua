-- Bootstrap packet manager 'packer.nvim'
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end


-- Load plugins
return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Language Server configurations
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require "lsp/init"
        end,
        requires = 'onsails/lspkind-nvim'
    }

    -- Auto completion plugin
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require "my_cmp"
        end,
        requires = {
            { "hrsh7th/cmp-nvim-lsp"},
            { "hrsh7th/cmp-buffer"},
            { "hrsh7th/cmp-path"},
            { "hrsh7th/cmp-vsnip"},
            { "hrsh7th/vim-vsnip"},
            { "hrsh7th/cmp-cmdline"},
            { "hrsh7th/nvim-cmp"},
        },
    }

    -- Autopairs writen in lua
    use {
        "windwp/nvim-autopairs",
        config = function()
            require"my_autopairs"
        end,
    }

    -- Fuzzy search with telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require"my_telescope"
        end,
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'kyazdani42/nvim-web-devicons'}
        },
    }

    -- Nice directory tree for nvim
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require"my_searchtree"
        end,
        requires = {
            {'kyazdani42/nvim-web-devicons'}
        }
    }

    use {
        'feline-nvim/feline.nvim',
        -- tag = 'v0.4.1',
        config = function ()
            require('my_feline')
            require('gitsigns').setup({
                signcolumn = false
            })
        end,
        requires = {
            {'kyazdani42/nvim-web-devicons'},
            {'lewis6991/gitsigns.nvim'},
            {'nvim-lua/plenary.nvim'}
        },
    }

    -- Base16 themes for neovim
    use {
        'RRethy/nvim-base16',
        config = function()
            require('my_colorscheme').setup()
        end,
        after = 'feline.nvim',
    }

    -- Better syntax highlighting, folding and more with treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function ()
            require("my_treesitter")
        end,
        requires = {'nvim-treesitter/nvim-treesitter-textobjects'},
        run = ":TSUpdate",
    }

    -- Universal switch pane navigation for vim and tmux
    use 'christoomey/vim-tmux-navigator'

    -- All about surroundings: parentheses, brackets, quotes, XML tags, and more.
    use 'tpope/vim-surround'

    -- Comment & uncomment blockes of code
    use {
        'tpope/vim-commentary',
        config = function ()
            local keymap = vim.api.nvim_set_keymap

            -- Press <C-/> to comment and uncomment
            keymap('n', '<C-_>', 'gcc', {})
            keymap('i', '<C-_>', '<ESC>gcc', {})
            keymap('v', '<C-_>', 'gc', {})
        end
    }

    -- Fancy dashboard for startup
    use {
        'glepnir/dashboard-nvim',
        config = function ()
            require('my_dashboard')
        end
    }

    -- Git wrapper for vim
    use 'tpope/vim-fugitive'

    -- Amazing mappings by tpope
    use 'tpope/vim-unimpaired'

    -- Repeat plugin commands of unimpared and commentary with .
    use 'tpope/vim-repeat'

    -- This plugin let's me monitor the startuptimes of all plugins
    use 'tweekmonster/startuptime.vim'

    -- This plugin runs mkview and loadview on file save and loading
    use"vim-scripts/restore_view.vim"

end)
