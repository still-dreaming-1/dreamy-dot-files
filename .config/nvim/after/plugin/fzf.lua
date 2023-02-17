if not vim.g.vscode then
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
