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

    -- Autopairs writen in lua
    use {
        "windwp/nvim-autopairs",
        config = function()
            require"my_autopairs"
        end,
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

    -- Smooth scolling
    use {
        'karb94/neoscroll.nvim',
        config = function ()
            require('neoscroll').setup()
        end
    }

    -- Git wrapper for vim
    use 'tpope/vim-fugitive'

    -- Amazing mappings by tpope
    use 'tpope/vim-unimpaired'

    -- Repeat plugin commands of unimpared and commentary with .
    use 'tpope/vim-repeat'

    -- This plugin runs mkview and loadview on file save and loading
    use 'vim-scripts/restore_view.vim'

end)
