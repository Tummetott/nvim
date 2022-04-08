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
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Set global options for all diagnostics
vim.diagnostic.config(
    {
        virtual_text = false,
        underline = false,
        update_in_insert = false
    }
)

-- Use rounded boarders for the hover floating window
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {
        border = "rounded"
    }
)

-- Use rounded boarders for the signature help floating window
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
        border = "rounded"
    }
)

local function set_keymaps()
    local map = vim.keymap.set
    local opts = {noremap = true, silent = true, buffer = 0}

    -- Go to next diagnostic. Function must be wrapped since we can't give
    -- arguments to a function pointer
    map('n', ']d', function()
        vim.diagnostic.goto_next({float = {border = "rounded"}})
    end, opts)

    -- Go to previous diagnostic. Function must be wrapped since we can't give
    -- arguments to a function pointer
    map('n', '[d', function()
        vim.diagnostic.goto_prev({float = {border = "rounded"}})
    end, opts)

    -- Hover lsp information
    map('n', '<Leader><Leader>', vim.lsp.buf.hover, opts)

    -- Go to definition
    map('n', 'gd', vim.lsp.buf.definition, opts)

    -- Rename
    map('n', '<Leader>r', vim.lsp.buf.rename, opts)

    -- Get signature help
    map('n', '<Leader>s', vim.lsp.buf.signature_help, opts)
end

-- C / C++ language server
require'lspconfig'.clangd.setup{
    on_attach = set_keymaps,
}

-- Python language server
require'lspconfig'.pyright.setup{
    on_attach = set_keymaps,
}

-- General purpose language server. I currently use it for sh and bash linting
local efm_setup = require'lsp/efm-langserver'
efm_setup.on_attach = set_keymaps
require'lspconfig'.efm.setup(efm_setup)

-- LUA language server
local sumneko_setup = require'lsp/sumneko-lua'
sumneko_setup.on_attach = set_keymaps
require'lspconfig'.sumneko_lua.setup(sumneko_setup)
