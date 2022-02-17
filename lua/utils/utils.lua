M = {}

-- Checks if dict has value
function M.has_value (tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

-- Get output from shell command. This only works with programs who print
-- on stdout
function M.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

-- This function return the line with the next trailing whitespace. If no
-- trailing whitespaces exists, the function returns nil
function M.get_next_trailing_whitespace()
    local line = vim.fn.search('\\s\\+$', 'nwc')
    if line == 0 then
        return nil
    else
        return line
    end
end

function M.jump_to_next_trailing_whitespace()
    local line = M.get_next_trailing_whitespace()
    if line then
        vim.cmd('norm! ' .. line .. 'gg$')
    end
end

-- When folding a function block where the first line ends with "{" and the
-- last line has only the closing "}", when append a "{ ... }" to the foldtext
function M.get_c_style_fold_text()
    local firstLine = vim.fn.getline(vim.v.foldstart)
    local lastLine = vim.fn.getline(vim.v.foldend)
    if string.find(firstLine, ".-{%s*$") and string.find(lastLine, ".-};?%s*$") then
        return string.gsub(firstLine, "(.-{)%s*$", "%1" .. " ... }")
    else
        return firstLine
    end
end

function M.show_blank_chars()
    vim.opt.list = true
    vim.g.indent_blankline_char = '│'
end

function M.hide_blank_chars()
    vim.opt.list = false
    vim.g.indent_blankline_char = ''
end

function M.toggle_blank_chars()
    if vim.g.indent_blankline_char == '' then
        M.show_blank_chars()
    else
        M.hide_blank_chars()
    end
end

function M.enable_cursorline()
    local palette = require'my_colorscheme'.get_current_base16_palette()
    vim.cmd('hi CursorLine guibg=' .. palette.base01)
    vim.g.cursorline_enabled = true
end

function M.disable_cursorline()
    vim.cmd('hi CursorLine guibg=bg')
    vim.g.cursorline_enabled = false
end

function M.toggle_cursorline()
    if vim.g.cursorline_enabled then
        M.disable_cursorline()
    else
        M.enable_cursorline()
    end
end

function M.enable_cursorcross()
    M.enable_cursorline()
    vim.opt.cursorcolumn = true
end

function M.disable_cursorcross()
    M.disable_cursorline()
    vim.opt.cursorcolumn = false
end

function M.toggle_cursorcross()
    if vim.g.cursorline_enabled then
        M.disable_cursorcross()
    else
        M.enable_cursorcross()
    end
end

return M
