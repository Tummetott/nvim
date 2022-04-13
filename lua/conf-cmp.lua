local cmp = require('cmp')
local mapping = require('cmp.config.mapping')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

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
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
        documentation = {
            winhighlight = 'NormalFloat:Pmenu,FloatBorder:None',
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-n>'] = mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-p>'] = mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = mapping.scroll_docs(-4),
        ['<Down>'] = mapping.scroll_docs(4),
        ['<C-y>'] = mapping(mapping.confirm({ select = true }), {'i', 'c'}),
        ['<C-e>'] = mapping(mapping.abort(), {'i', 'c'}),
        ['<CR>'] = mapping({
            i = mapping.confirm({ select = false }),
        }),
        -- When a snipped is active, expand or jump the snipped. Otherwise use
        -- the default keymap as fallback
        ['<C-f>'] = mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-b>'] = mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' })
    },
    -- The order in which I specify sources defines the priority
    sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
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

-- Config for luasnips
luasnip.config.set_config ({
    -- When true, jump back to a snipped even if you moved outside of the selection
    history = false,
    -- Define events when the snippeds get updated. We want to have dynamic
    -- snippets so I choose to update them whenever the text changed
    updateevents = 'TextChanged,TextchangedI',
})

-- Load friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()
require('conf-luasnip')
