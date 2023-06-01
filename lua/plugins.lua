return require('packer').startup(function(use) 
    use 'wbthomason/packer.nvim'

    use ({
        'nvim-lualine/lualine.nvim',
        config = function() require('inner.lualine') end,
    })
    use 'ellisonleao/gruvbox.nvim'  

    use 'kyazdani42/nvim-web-devicons'
    
    use {
        'nvim-telescope/telescope.nvim', 
        requires = {'nvim-lua/plenary.nvim'},
    }

    use ({
        'ms-jpq/chadtree',
        run = 'python3 -m chadtree deps',
    })

end)
