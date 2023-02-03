-- vim.cmd[[colorscheme tokyonight-night]]
vim.cmd[[colorscheme tokyonight-moon]]

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

-- LSP stuff:
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require 'lsp-zero'
lsp.preset('recommended')
lsp.set_preferences({
    set_lsp_keymaps = {
        omit = {
            '<C-k>',
        }
    },
})
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr}
    local bind = vim.keymap.set

    -- Displays signature information about the symbol under the cursor in a floating window
    bind('n', '<leader><leader>k', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
end)
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()
lsp.setup()
