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
if vim.fn.has('nvim-0.6') == 1 then
    local signs = { Error = "", Warn = "", Hint = "", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
else
    local signs = { Error = "", Warning = "", Hint = "", Information = "" }
    for type, icon in pairs(signs) do
      local hl = "LspDiagnosticsSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
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

local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities())

-- C / C++ language server
require'lspconfig'.clangd.setup {
    capabilities = capabilities
}

-- Python language server
require'lspconfig'.pyright.setup {
    capabilities = capabilities
}

-- Bash language server without linting. Just for completion
if os.execute('test -x "$(command -v bash-language-server)"') == 0 then
    require'lspconfig'.bashls.setup {
        capabilities = capabilities
    }
end

-- General purpose language server. I currently use it for sh / bash linting.
-- Currently I only have it installed on macOS
if os.execute('test -x "$(command -v efm-langserver)"') == 0 then
    require('lsp/efm-langserver')
end

-- LUA language server
require('lsp/sumneko-lua')
