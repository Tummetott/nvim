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

return M
