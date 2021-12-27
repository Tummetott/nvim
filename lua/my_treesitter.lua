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
        'html'
    },
    highlight = { enable = true },
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
