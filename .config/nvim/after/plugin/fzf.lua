if vim.g.vscode then
    vim.keymap.set(
        'n',
        '<leader>f',
        [[<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>]]
    )
else
    require 'fzf-lua'.setup({
        file_icon_padding = ' ',
    })
    -- use leader f to run :FzfLua files command
    vim.keymap.set(
        'n',
        '<leader>f',
        function() require("fzf-lua").files() end
    )
end
