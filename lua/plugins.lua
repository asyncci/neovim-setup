return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use ({
        'nvim-lualine/lualine.nvim',
        config = function() require('inner.lualine') end,
    })

    use 'ellisonleao/gruvbox.nvim'
    use 'navarasu/onedark.nvim'

    use 'kyazdani42/nvim-web-devicons'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'},
    }

    use ({
        'ms-jpq/chadtree',
        run = 'python3 -m chadtree deps',
    })

    use ({
        'nvim-treesitter/nvim-treesitter',
        config = function() require('inner.tree-sitter') end,
    })

    use 'tpope/vim-sleuth'

    use 'neovim/nvim-lspconfig'

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use 'windwp/nvim-autopairs'
    use 'm4xshen/autoclose.nvim'

    use 'romgrk/barbar.nvim'

    use 'startup-nvim/startup.nvim'

end)
