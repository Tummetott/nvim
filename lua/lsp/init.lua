-- Configure custom pictograms for lspkind
require('lspkind').init({
    with_text = true,
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

local keymap = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- Go to next diagnostic
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" } })<CR>', opt)

-- Go to previous diagnostic
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" } })<CR>', opt)

-- Hover lsp information
keymap('n', '<Leader><Leader>', '<cmd>lua vim.lsp.buf.hover()<CR>',opt)

-- Go to definition
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)

-- Refactor
keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)

-- Get signature help
keymap('n', '<Leader>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)

-- C / C++ language server
require'lspconfig'.clangd.setup{}

-- Python language server
require'lspconfig'.pyright.setup{}

-- General purpose language server. I currently use it for sh and bash linting
require('lsp/efm-langserver')

-- LUA language server
require('lsp/sumneko-lua')
