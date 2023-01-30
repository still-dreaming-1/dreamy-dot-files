return require('packer').startup(function(use)
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
        'ibhagwan/fzf-lua',
        requires = 'nvim-tree/nvim-web-devicons'
    }
    use {
        'Shougo/deoplete.nvim',
        run = ':UpdateRemotePlugins'
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { 'neoclide/coc.nvim', branch = 'release' }
    use { 'folke/tokyonight.nvim', branch = 'main' }
    use 'rcarriga/nvim-notify'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- nightly means stable...
    }
    if vim.g.dreamy_developer then
        use { 'git@github.com:still-dreaming-1/vim-elhiv.git', branch = 'develop' }
    else
        use 'still-dreaming-1/vim-elhiv'
    end
    if vim.g.dreamy_developer then
        use { 'git@github.com:still-dreaming-1/vim-project-search.git', branch = 'develop' }
    else
        use 'still-dreaming-1/vim-project-search'
    end
    if vim.g.dreamy_developer then
        use { 'git@github.com:still-dreaming-1/nvim-dreamy-terminal.git', branch = 'develop' }
    else
        use 'still-dreaming-1/nvim-dreamy-terminal'
    end
end)
