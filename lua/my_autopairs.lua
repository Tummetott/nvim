local npairs = require('nvim-autopairs')
local Rule   = require'nvim-autopairs.rule'
local cond = require'nvim-autopairs.conds'
local utils = require('nvim-autopairs.utils')

npairs.setup({
    check_ts = true,
    ts_config = {
        -- Don't expand pairs when inside a 'string' treesitter object in LUA
        lua = {'string'},
        python = {'string'},
    },
    -- When the next char is alphanumeric after opening pair, don't close
    ignored_next_char = "%w",
})

npairs.add_rules {
    -- (|) --> press "space" --> ( | )
    -- {|} --> press "space" --> { | }
    -- [|] --> press "space" --> [ | ]
    Rule(' ', ' ')
    :with_pair(function (opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),

    -- ( stuff| ) --> press ")" --> ( stuff )|
    Rule('( ', ' )')
    :with_pair(function() return false end)
    :with_move(function(opts)
        return opts.prev_char:match('.%)') ~= nil
    end)
    :use_key(')'),

    -- { stuff| } --> press "}" --> { stuff }|
    Rule('{ ', ' }')
    :with_pair(function() return false end)
    :with_move(function(opts)
        return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key('}'),

    -- [ stuff| ] --> press "]" --> [ stuff ]|
    Rule('[ ', ' ]')
    :with_pair(function() return false end)
    :with_move(function(opts)
        return opts.prev_char:match('.%]') ~= nil
    end)
    :use_key(']')
}

-- Add endwise rules for lua
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))

-- When inside pairs and you type the closing pair
-- when it's on the new line
local function multiline_close_jump(char)
    return Rule(char, '')
        :with_pair(function()
            local row, col = utils.get_cursor()
            local line = utils.text_get_current_line()

            if #line ~= col then --not at EOL
                return false
            end

            local nextrow = row + 1
            if nextrow < vim.api.nvim_buf_line_count(0)
                and vim.regex("^\\s*" .. char):match_line(0, nextrow) then
                return true
            end
            return false
        end)
        :with_move(cond.none())
        :with_cr(cond.none())
        :with_del(cond.none())
        :set_end_pair_length(0)
        :replace_endpair(function()
            return '<esc>xwa'
        end)
end

npairs.add_rules {
    multiline_close_jump(')'),
    multiline_close_jump(']'),
    multiline_close_jump('}'),
}
