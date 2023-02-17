-- packer commands:
-- :PackerSync - Perform `PackerUpdate` (clean, update, and install plugins) and then `PackerCompile`
-- :PackerClean - removed disabled or unused plugins
return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'jlanzarotta/bufexplorer'
    use 'terryma/vim-expand-region'
    use 'qpkorr/vim-bufkill'
    use 'tpope/vim-repeat'
    use 'tpope/vim-commentary'
    if vim.g.dreamy_developer then
        use {
            'git@github.com:still-dreaming-1/vim-elhiv.git',
            branch = 'develop',
        }
    else
        use {
            'still-dreaming-1/vim-elhiv',
            branch = 'develop',
        }
    end
    if not vim.g.vscode then
        use 'neomake/neomake'
        use 'tpope/vim-fugitive'
        use 'jreybert/vimagit'
        use {
            'LucHermitte/vim-UT', -- unit testing
            requires = 'LucHermitte/lh-vim-lib'
        }
        use {
            'nvim-tree/nvim-tree.lua',
            requires = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
            tag = 'nightly', -- nightly = stable...
        }
        use {
            'ibhagwan/fzf-lua',
            requires = 'nvim-tree/nvim-web-devicons',
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
        }
        use {
            'folke/tokyonight.nvim',
            branch = 'main',
        }
        if vim.g.dreamy_developer then
            use {
                'git@github.com:still-dreaming-1/vim-project-search.git',
                branch = 'develop',
                requires = {{
                    'git@github.com:still-dreaming-1/vim-elhiv.git',
                    branch = 'develop',
                }}
            }
        else
            use {
                'still-dreaming-1/vim-project-search',
                branch = 'develop',
                requires = {{
                    'still-dreaming-1/vim-elhiv',
                    branch = 'develop',
                }}
            }
        end
    end
end)
