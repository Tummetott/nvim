-- The config only works with this version of nvim or newer
 local version = '0.7'

-- If the nvim version is too old, print error message and return
 if vim.fn.has('nvim-' .. version) ~= 1 then
     vim.api.nvim_echo({{
        'Nvim version ' .. version .. ' or newer is required!',
        'WarningMsg'
    }}, true, {})
    return
 end

 -- Load plugins
 require('my_plugins')

 -- Load global 'set' options
 require('my_globals')

 -- Load keymappings
 require('my_mapping')
