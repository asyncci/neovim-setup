return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    --syntax highlight
    use 'nvim-treesitter/nvim-treesitter'

    --file explorer
    use 'nvim-tree/nvim-tree.lua'

    --fuzzy
    use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'}

    --buffers
    use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}

    --appearance 
    use 'mcchrish/zenbones.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'


end)
