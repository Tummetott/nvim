-- Bootstrap packet manager 'packer.nvim'
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command('packadd packer.nvim')
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
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-cmdline'},
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},
            {'rafamadriz/friendly-snippets'}
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
            require('my_searchtree')
        end,
        requires = {
            {'kyazdani42/nvim-web-devicons'}
        }
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('my_gitsigns')
        end,
    }

    use {
        'feline-nvim/feline.nvim',
        -- tag = 'v0.4.1',
        config = function ()
            require('my_feline')
        end,
        requires = {
            {'kyazdani42/nvim-web-devicons'},
            {'nvim-lua/plenary.nvim'}
        },
        after = 'gitsigns.nvim',
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
        'numToStr/Comment.nvim',
        config = function ()
            require('Comment').setup()
            -- Press <C-/> to comment and uncomment
            local map = vim.keymap.set
            local opt = {noremap = true, silent = true}
            map({'n', 'i'}, '<C-_>', require("Comment.api").toggle_current_linewise, opt)
            vim.cmd'xmap <C-_> gcgv' -- Don't know how to write this in lua
        end
    }

    -- Fancy dashboard for startup
    use {
        'glepnir/dashboard-nvim',
        config = function ()
            require('my_dashboard')
        end
    }

    -- Smooth scolling
    use {
        'karb94/neoscroll.nvim',
        config = function ()
            require('neoscroll').setup()
        end
    }

    -- Show my current indent scope with a grey line
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            require("indent_blankline").setup {
                char = '',
                context_char = '│',
                show_current_context = true,
                use_treesitter = true,
                filetype_exclude = {
                    'NvimTree',
                    'man',
                    'help',
                    'dashboard',
                },
            }
        end
    }

    -- Git wrapper for vim
    use 'tpope/vim-fugitive'

    -- Amazing mappings by tpope
    use 'tpope/vim-unimpaired'

    -- Repeat plugin commands of unimpared and with .
    use 'tpope/vim-repeat'

    -- This plugin runs mkview and loadview on file save and loading
    use 'vim-scripts/restore_view.vim'

end)
