if not vim.g.vscode then
    require 'fzf-lua'.setup({
        file_icon_padding = ' ',
    })

    -- use leader f to run :FzfLua files command
    vim.api.nvim_set_keymap(
        'n',
        '<leader>f',
        '<cmd>lua require("fzf-lua").files()<CR>',
        { noremap = true }
    )
end
