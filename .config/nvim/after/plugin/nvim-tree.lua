-- settings related to nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
    -- the following 2 lines are already done at the start of my config
        -- vim.g.loaded_netrw = 1
        -- vim.g.loaded_netrwPlugin = 1
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
