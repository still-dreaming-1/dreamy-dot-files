if not vim.g.vscode then
    local lsp = require('lsp-zero').preset({
        name = 'minimal',
        set_lsp_keymaps = {
            omit = {'<C-k>'},
        },
        manage_nvim_cmp = true,
        suggest_lsp_servers = true,
    })

    lsp.setup_nvim_cmp({
        mapping = lsp.defaults.cmp_mappings({
            ['<CR>'] = vim.NIL,
        })
    })

    lsp.on_attach(function(client, bufnr)
        local opts = {
            buffer = bufnr,
            remap = false
        }
        -- Displays signature information about the symbol under the cursor in a floating window
        vim.keymap.set('n', '<leader><leader>k', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    end)

    lsp.nvim_workspace() -- Configure lua language server for neovim
    lsp.setup()
end
