local npairs = require('nvim-autopairs')
local Rule   = require'nvim-autopairs.rule'
local cond = require'nvim-autopairs.conds'

npairs.setup({
    check_ts = true,
    ts_config = {
        -- Don't expand pairs when inside a 'string' treesitter object in LUA
        lua = {'string'},
        python = {'string'},
        c = {'string'},
    },
    enable_bracket_in_quote = false,
    -- When the next char is alphanumeric after opening pair, don't close
    ignored_next_char = "%w",
})

npairs.add_rules {
    -- (|) --> press 'space' --> ( | )
    -- ( | ) --> press 'del' --> ()
    -- Same operations for '{}' and '[]'
    Rule(' ', ' ')
    :with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end)
    :with_cr(cond.none())
    :with_move(cond.none())
    :with_del(function(opts)
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local context = opts.line:sub(col - 1, col + 2)
      return vim.tbl_contains({ '(  )', '{  }', '[  ]' }, context)
    end),

    -- stuff| ) --> press ')' --> stuff )|
    Rule('', ' )')
        :with_pair(cond.none())
        :with_move(function(opts) return opts.char == ')' end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key(')'),

    -- stuff| } --> press '}' --> stuff }|
    Rule('', ' }')
        :with_pair(cond.none())
        :with_move(function(opts) return opts.char == '}' end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key('}'),

    -- stuff| ] --> press ']' --> stuff ]|
    Rule('', ' ]')
        :with_pair(cond.none())
        :with_move(function(opts) return opts.char == ']' end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key(']'),
}
