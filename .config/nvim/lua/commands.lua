if not vim.g.vscode then
    local opts = { force = true }
    vim.api.nvim_create_user_command(
        'ToggleMouse',
        function (params)
            if vim.o.mouse == '' then
                vim.o.mouse = 'a'
            else
                vim.o.mouse = ''
            end
        end,
        opts
    )
end
