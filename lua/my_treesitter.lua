require'nvim-treesitter.configs'.setup {
    ensure_installed ={
        'c',
        'python',
        'lua',
        'rust',
        'java',
        'bash',
        'json',
        'cpp',
        'yaml',
        'dockerfile',
        'html',
        'rust',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
            },
        },
    },
}
