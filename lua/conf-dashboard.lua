local bird = {
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⡿⠟⢛⡙⠓⣤⣤⡤⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡏⢀⣠⣭⣥⠈⡟⠉⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣷⣌⣛⣙⢿⣷⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣿⣿⣿⣿⣿⣿⠿⠿⠧⠉⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠿⢛⣩⣴⣿⣿⣄⠀⢀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢢⣿⣿⠟⣡⣾⣿⣿⣿⣿⣿⡿⢃⡌⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⢾⡿⢋⣾⣿⣿⣿⣿⣿⡿⠟⠁⣸⠃⠃⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⢀⠀⣰⣇⠀⠀⠀⠀⠀⠀⡷⠦⢖⡤⠘⡿⠿⢛⣉⣥⣴⡶⠋⢠⡟⡸⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠈⠛⠻⣿⣷⣦⣤⠄⢰⡷⡰⠞⡩⢖⡥⢒⠞⡫⣻⠟⢁⡴⢡⡿⢰⠃⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠛⠻⠟⠉⠉⣼⢎⣤⠖⣫⢖⡫⠒⢁⡬⢊⣵⠞⠟⣡⡿⢡⠃⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡃⠋⠔⠉⠒⣉⡤⠞⣁⣀⠀⠀⠀⣴⠟⣱⠃⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⡁⢒⣕⠵⢚⣥⡄⠸⢟⣿⣿⣿⣶⣶⡟⠑⢛⠟⢭⣥⣀⣠⣄',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣫⣈⠿⠋⢀⣴⡿⠛⠁⠀⠐⠉⠙⠉⠉⠀⠀⠄⠁⠀⠀⠈⠻⣿⣿',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⡀⠠⠚⠁⠾⠛⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛',
    '⠀⠀⠀⠀⠀⠀⠀⣠⠂⣀⣤⡴⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⣠⣾⣫⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⢀⣴⣾⢟⣽⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⢀⣴⡿⢟⣵⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠾⢻⣆⡟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
}

local cat = {
    '⠀⡀⠀⠀⠀⢠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠈⣿⢶⣦⡏⠙⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⢀⣴⣿⣿⣿⣿⣾⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⣿⡿⢛⣿⣿⣿⣿⢿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⢀⣿⣷⣿⣿⣿⣿⠃⣾⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠺⠿⠿⣿⣿⣿⣼⣿⣿⣿⣿⣿⣠⣄⡀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣷⣆⠀⠀⠀⠀',
    '⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⠏⣾⣿⣿⣿⣿⣿⡀⠀⠀⠀',
    '⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⡟⣰⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀',
    '⠀⠀⠀⠀⠻⣿⣿⣿⣿⢏⣴⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣿⢣⣿⡿⢟⣿⣿⣿⠀⠀',
    '⠀⠀⠀⠀⠀⠀⢹⣷⣽⢻⣿⣿⠃⠞⣫⣴⣿⣿⣿⣿⡟⠀',
    '⠀⠀⠀⠀⠀⢳⣄⠙⠇⢸⣿⠃⣠⣾⣿⣿⣿⣿⣿⣿⡇⠀',
    '⠀⠀⠀⠀⠀⠀⢿⣷⣤⣈⠛⠀⢿⣿⣿⣿⣿⣿⣿⠟⠀⠀',
    '⠀⠀⠀⠀⠀⠀⢀⡉⠛⢿⣿⣶⣤⣈⣉⣉⣉⣉⣉⣰⣿⠄',
    '⠀⠀⠀⠀⠀⠀⠏⢴⣷⡦⠌⠙⠻⢿⡿⠿⠿⠿⠿⠿⠃⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
}
vim.g.dashboard_disable_at_vimenter = 0
vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_header = cat
vim.g.dashboard_custom_section = {
    a = { description = { "     New File     " }, command = "ene | startinsert" },
    b = { description = { "     Find File    " }, command = "Telescope find_files" },
    c = { description = { "     Recent Files " }, command = "Telescope oldfiles" },
    d = { description = { "     Find Word    " }, command = "Telescope live_grep" },
    e = { description = { "     Search Help  " }, command = "Telescope help_tags" },
}
vim.g.dashboard_custom_footer = {} --vim.tbl_count(_G.packer_plugins)
