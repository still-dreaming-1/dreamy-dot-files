return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'jlanzarotta/bufexplorer'
    use 'terryma/vim-expand-region'
    use 'neomake/neomake'
    use 'tpope/vim-fugitive'
    use 'jreybert/vimagit'
    use 'tpope/vim-commentary'
    use {
        'LucHermitte/vim-UT', -- unit testing
        requires = 'LucHermitte/lh-vim-lib'
    }
    use 'qpkorr/vim-bufkill'
    use 'metakirby5/codi.vim'
    use 'tpope/vim-repeat'
    use 'ron89/thesaurus_query.vim'
    use 'udalov/kotlin-vim'
    use 'leafgarland/typescript-vim'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
        tag = 'nightly', -- nightly = stable...
    }
    use {
        'ibhagwan/fzf-lua',
        requires = 'nvim-tree/nvim-web-devicons',
        tag = 'nightly', -- nightly = stable...
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use {
        'folke/tokyonight.nvim',
        branch = 'main',
    }
    use 'rcarriga/nvim-notify'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
    if vim.g.dreamy_developer then
        use {
            'git@github.com:still-dreaming-1/vim-elhiv.git',
            branch = 'develop',
        }
    else
        use 'still-dreaming-1/vim-elhiv'
    end
    if vim.g.dreamy_developer then
        use {
            'git@github.com:still-dreaming-1/vim-project-search.git',
            branch = 'develop',
        }
    else
        use 'still-dreaming-1/vim-project-search'
    end
end)
