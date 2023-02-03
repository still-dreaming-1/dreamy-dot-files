-- vim.cmd[[colorscheme tokyonight-night]]
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

-- settings related to nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- empty setup using defaults
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
})
