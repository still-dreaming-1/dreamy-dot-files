if not vim.g.vscode then
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
