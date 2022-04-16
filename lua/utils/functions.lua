local M = {}

-- Get output from shell command. This only works with programs who print on
-- stdout
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

function _G.custom_foldtext()
    local text = vim.fn.getline(vim.v.foldstart)
    local lastline = vim.fn.getline(vim.v.foldend)

    -- When folding a function in c style syntax (with curly braces around it),
    -- append '{ ... }' to the foldtext
    if string.find(text, '.-{%s*$') and string.find(lastline, '.-};?%s*$') then
        text = string.gsub(text, '(.-{)%s*$', '%1' .. ' ... }')
    end

    -- When there are e.g. TABS included in the foldtext, the width depends on
    -- the tabstop setting. This function gets the right width
    local text_width = vim.fn.strdisplaywidth(text)

    local ending = string.format('%d lines', vim.v.foldend - vim.v.foldstart + 1)
    local ending_width = vim.fn.strwidth(ending)

    -- Hackaround how to get the current gutter width (line number column, sign
    -- column, foldcolumn)
    local ffi = require("ffi")
    ffi.cdef('int curwin_col_off(void);')
    local gutter_width = ffi.C.curwin_col_off()

    local win_width = vim.api.nvim_win_get_width(0) - gutter_width
    local fillers = string.rep('⋅', win_width - text_width - ending_width - 2)

    return string.format('%s %s %s', text, fillers, ending)
end

function M.show_blank_chars()
    vim.opt.list = true
    vim.g.indent_blankline_char = '│'
    -- Fire the CursorMoved autocmd in order to let IndentBlankline update the
    -- virtual text indent lines
    vim.api.nvim_exec_autocmds('CursorMoved', {buffer = 0, modeline = false})
end

function M.hide_blank_chars()
    vim.opt.list = false
    vim.g.indent_blankline_char = ''
    -- Fire the CursorMoved autocmd in order to let IndentBlankline update the
    -- virtual text indent lines
    vim.api.nvim_exec_autocmds('CursorMoved', {buffer = 0, modeline = false})
end

function M.toggle_blank_chars()
    if vim.g.indent_blankline_char == '' then
        M.show_blank_chars()
    else
        M.hide_blank_chars()
    end
end

function M.enable_cursorline()
    local palette = require'conf-colorscheme'.get_current_base16_palette()
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
