local cmp = require'cmp'
local mapping = require('cmp.config.mapping')
local lspkind = require('lspkind')

cmp.setup({
    -- This option enables lspkind icons
    formatting = {
        format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    },
    -- This sets the boarder of my documentation floating window
    documentation = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-n>'] = mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-p>'] = mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-d>'] = mapping.scroll_docs(-4),
        -- ['<C-f>'] = mapping.scroll_docs(4), TODO: find a better shortcut since i need ctrl-f
        ['<C-y>'] = mapping.confirm({ select = false }),
        ['<C-e>'] = mapping.abort(),
        ['<Tab>'] = mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })),
        ['<CR>'] = mapping({
            i = mapping.confirm({ select = false }),
        }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

-- This command connects the autopairs with the cmp
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
