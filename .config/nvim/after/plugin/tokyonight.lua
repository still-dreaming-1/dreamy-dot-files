if not vim.g.vscode then
    require("tokyonight").setup({
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
            -- Value is any valid attr-list value for `:help nvim_set_hl`
            variables = { fg = '#00EBAC' },
        },
    })
    vim.cmd 'colorscheme tokyonight-moon'

    local dreamyIsMoon = true

    function dreamyToggleColor()
        if dreamyIsMoon then
            vim.cmd 'colorscheme tokyonight-night'
            dreamyIsMoon = false
        else
            vim.cmd 'colorscheme tokyonight-moon'
            dreamyIsMoon = true
        end
    end

    vim.cmd 'command! Color lua dreamyToggleColor()'
end
