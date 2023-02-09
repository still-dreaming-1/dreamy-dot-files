if not vim.g.vscode then
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
        local opts = {buffer = bufnr, remap = false}

        -- Displays signature information about the symbol under the cursor in a floating window
        vim.keymap.set('n', '<leader><leader>k', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    end)

    lsp.nvim_workspace() -- Configure lua language server for neovim
    lsp.setup()
end
