-- Configure custom pictograms for lspkind
require('lspkind').setup({
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

-- Fix to create a border around the :LspInfo floating window
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

local function on_attach()
    local wk = require('which-key')

    -- Navigating diagnostics
    wk.register({
        [']d'] = {
            function()
                vim.diagnostic.goto_next({ float = { border = 'rounded' } })
            end,
            'Go to next diagnostic',
        },
        ['[d'] = {
            function()
                vim.diagnostic.goto_prev({ float = { border = 'rounded' } })
            end,
            'Go to previous diagnostic',
        },
    }, { buffer = 0 })

    wk.register({
        ['<Leader>'] = { vim.lsp.buf.hover, 'Show lsp hover info' },
        l = {
            name = 'Lsp',
            d = { vim.lsp.buf.definition, 'go to definition' },
            c = { vim.lsp.buf.declaration, 'go to declaration' },
            t = { vim.lsp.buf.type_definition, 'go to type definition' },
            i = { vim.lsp.buf.implementation, 'go to implementation' },
            r = { vim.lsp.buf.rename, 'rename' },
            s = { vim.lsp.buf.signature_help, 'show signature help' },
            f = { vim.lsp.buf.formatting, 'auto formatting' },
            h = { vim.lsp.buf.document_highlight, 'highlight' },
        },
        q = {
            name = 'Quickfix list',
            -- TODO: set to location list?
            d = { vim.diagnostic.setqflist, 'open diagnostics' },
            r = { vim.lsp.buf.references, 'open references' },
        },
    }, { prefix = '<Leader>', buffer = 0 })

    local autocmd = vim.api.nvim_create_autocmd
    local autogroup = vim.api.nvim_create_augroup

    -- Autocmd to reset document highlights as soon as the cursor moves
    local group = autogroup('LspClearDocumentHighlights', { clear = true })
    autocmd('CursorMoved', {
        callback = vim.lsp.buf.clear_references,
        group = group
    })
end

-- C / C++ language server
require 'lspconfig'.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Python language server
require 'lspconfig'.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- General purpose language server. I currently use it for sh and bash linting
local efm_setup = require 'lsp/efm-langserver'
efm_setup.on_attach = on_attach
efm_setup.capabilities = capabilities
require 'lspconfig'.efm.setup(efm_setup)

-- LUA language server
local sumneko_setup = require 'lsp/sumneko-lua'
sumneko_setup.on_attach = on_attach
sumneko_setup.capabilities = capabilities
require 'lspconfig'.sumneko_lua.setup(sumneko_setup)
