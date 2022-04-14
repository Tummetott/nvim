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

    -- Interactive help for my keymaps
    use {
        'folke/which-key.nvim',
        config = function()
            require 'conf-whichkey'
        end
    }

    -- Language Server configurations
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require'conf-lsp'
        end,
        requires = 'onsails/lspkind-nvim'
    }

    -- Auto completion plugin
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require'conf-cmp'
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
        'windwp/nvim-autopairs',
        config = function()
            require'conf-autopairs'
        end,
    }

    -- Fuzzy search with telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require'conf-telescope'
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
            require('conf-nvimtree')
        end,
        requires = {
            {'kyazdani42/nvim-web-devicons'}
        }
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('conf-gitsigns')
        end,
    }

    use {
        'feline-nvim/feline.nvim',
        -- tag = 'v0.4.1',
        config = function ()
            require('conf-feline')
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
            require('conf-colorscheme').setup()
        end,
        after = 'feline.nvim',
    }

    -- Better syntax highlighting, folding and more with treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function ()
            require('conf-treesitter')
        end,
        requires = {'nvim-treesitter/nvim-treesitter-textobjects'},
        run = ':TSUpdate',
    }

    -- Universal switch pane navigation for vim and tmux
    use 'christoomey/vim-tmux-navigator'

    -- All about surroundings: parentheses, brackets, quotes, XML tags, and more.
    use 'tpope/vim-surround'

    -- Comment & uncomment blockes of code
    use {
        'numToStr/Comment.nvim',
        config = function ()
            require('conf-comment')
        end
    }

    -- Fancy dashboard for startup
    use {
        'glepnir/dashboard-nvim',
        config = function ()
            require('conf-dashboard')
        end
    }

    -- Smooth scolling
    use {
        'karb94/neoscroll.nvim',
        config = function ()
            require('conf-neoscroll')
        end
    }

    -- Show my current indent scope with a grey line
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('conf-indentblankline')
        end
    }

    -- Usefull settings for quickfix / location list windows
    use {
        'romainl/vim-qf',
        config = function()
            local wk = require('which-key')
            wk.register({
                ['<Leader>qq'] = {
                    '<Plug>(qf_qf_toggle)',
                    'toggle'
                }
            })
        end
    }

    -- Amazing keymappings by tpope
    use {
        'tpope/vim-unimpaired',
        config = function()
            require 'conf-unimpaired'
        end
    }

    -- Repeat plugin commands of unimpared and with .
    use 'tpope/vim-repeat'

    -- This plugin runs mkview and loadview on file save and loading
    use 'vim-scripts/restore_view.vim'

end)
