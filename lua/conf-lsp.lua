-- Configure custom pictograms for lspkind
require('lspkind').init({
    mode = 'symbol_text',
    symbol_map = {
      Text = '',
      Method = '',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})

-- Define diagnostic icons
local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
end

-- Set global options for all diagnostics
vim.diagnostic.config({
        virtual_text = false,
        underline = false,
        update_in_insert = false
})

-- Use rounded boarders for the hover floating window
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = 'rounded'
})

-- Use rounded boarders for the signature help floating window
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = 'rounded'
})

-- Fix to create a border around the LspInfo floating window
local win = require('lspconfig.ui.windows')
local _default_opts = win.default_opts
win.default_opts = function(options)
    local opts = _default_opts(options)
    opts.border = 'rounded'
    return opts
end

-- Generate capabilities of client and let them update by nvim-cmp.
-- Capabilities are send to all languae servers in the setup function
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- This function sets all keymaps for an attached server. The function is
-- passed to the setup functions of the server too
local function set_keymaps()
    local map = vim.keymap.set
    local opts = { buffer = 0 }

    -- Go to next diagnostic. Function must be wrapped since we can't give
    -- arguments to a function pointer
    map('n', ']d', function()
        vim.diagnostic.goto_next({ float = { border = 'rounded' } })
    end, opts)

    -- Go to previous diagnostic. Function must be wrapped since we can't give
    -- arguments to a function pointer
    map('n', '[d', function()
        vim.diagnostic.goto_prev({ float = { border = 'rounded' } })
    end, opts)

    -- Hover lsp information
    map('n', '<Leader><Leader>', vim.lsp.buf.hover, opts)

    -- Go to definition
    map('n', '<Leader>gd', vim.lsp.buf.definition, opts)

    -- Go to declatation
    map('n', '<Leader>gd', vim.lsp.buf.declaration, opts)

    -- Go to type definition (e.g. definition of struct)
    map('n', '<Leader>gt', vim.lsp.buf.type_definition, opts)

    -- Go to implementation (e.g. not the interface like goto definition)
    map('n', '<Leader>gi', vim.lsp.buf.implementation, opts)

    -- Open all references in quickfix window
    map('n', '<Leader>gr', vim.lsp.buf.references, opts)

    -- Rename
    map('n', '<Leader>r', vim.lsp.buf.rename, opts)

    -- Get signature help
    map('n', '<Leader>s', vim.lsp.buf.signature_help, opts)

    --- Open all errors in quickfix list. TODO: change to location list?
    map('n', '<Leader>q', vim.diagnostic.setqflist, opts)

    map('n', '<Leader>df', vim.lsp.buf.formatting, opts)
end

-- C / C++ language server
require 'lspconfig'.clangd.setup {
    on_attach = set_keymaps,
    capabilities = capabilities,
}

-- Python language server
require 'lspconfig'.pyright.setup {
    on_attach = set_keymaps,
    capabilities = capabilities,
}

-- General purpose language server. I currently use it for sh and bash linting
local efm_setup = require 'lsp/efm-langserver'
efm_setup.on_attach = set_keymaps
efm_setup.capabilities = capabilities
require 'lspconfig'.efm.setup(efm_setup)

-- LUA language server
local sumneko_setup = require 'lsp/sumneko-lua'
sumneko_setup.on_attach = set_keymaps
sumneko_setup.capabilities = capabilities
require 'lspconfig'.sumneko_lua.setup(sumneko_setup)
