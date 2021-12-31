require 'lspconfig'.efm.setup {
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            sh = {
                {
                    lintCommand = 'shellcheck -f gcc -x',
                    lintSource = 'shellcheck',
                    lintFormats = {
                        '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m',
                        '%f:%l:%c: %tote: %m'
                    },
                },
            },
        }
    },
    filetypes = { 'bash','sh' }
}
