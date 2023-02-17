if not vim.g.vscode then
    require 'nvim-tree'.setup({
        sync_root_with_cwd = true,
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        git = {
            ignore = false,
        },
        view = {
            width = 60,
        },
    })
end
