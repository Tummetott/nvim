local cmp = require'cmp'
local mapping = require('cmp.config.mapping')
local lspkind = require('lspkind')

cmp.setup({
    -- This section defines the look of the completion popup. The plugin
    -- lspkind adds nerdfonts and takes care about the formatting.
    formatting = {
        format = lspkind.cmp_format({
            -- Don't write the type of completion, just show the icon
            with_text = false,
            maxwidth = 50,
            -- Show the completion source
            menu = {
                buffer = '[BUF]',
                nvim_lsp = '[LSP]',
                nvim_lua = '[API]',
                path = '[PATH]',
                luasnip = '[SNIP]',
            },
        })
    },
    -- I want my documentation window to look like my completion window. That's
    -- why I highlight the NormalFloat like the Pmenu. The two windows should
    -- be visibly separated so I deactivate highlighting of the FloatBorder.
    -- TODO: Vim has problems parsing the documentation text and highlights
    -- closing brackets as error. TODO: Disable the Error highlight group.
    -- TODO: Set padding in documentation window
    documentation = {
        winhighlight = 'NormalFloat:Pmenu,FloatBorder:None',
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-n>'] = mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-p>'] = mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = mapping.scroll_docs(-4),
        ['<Down>'] = mapping.scroll_docs(4),
        ['<C-y>'] = mapping.confirm({ select = true }),
        ['<C-e>'] = mapping.abort(),
        ['<CR>'] = mapping({
            i = mapping.confirm({ select = false }),
        }),
    },
    -- The order in which I specify sources defines the priority
    sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        -- { name = 'vsnip' },
        { name = 'buffer', keyword_length = 5, max_item_count = 10 },
    })
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
    formatting = {
        -- Only show the completion itself, no icon, no completion source
        fields = { 'abbr' },
    },
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- This command connects the autopairs with the cmp
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
