local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- Define custom snippets
ls.snippets = {
    sh = {
        s('ifhas', fmt('if command -v {} 1>/dev/null 2>&1 ; then\n    {}\nfi', {i(1, 'command'), i(0)})),
    },
    all = {

    }
}
