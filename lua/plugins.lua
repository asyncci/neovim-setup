return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    --syntax highlight
    use 'nvim-treesitter/nvim-treesitter'

    --file explorer
    --    use 'nvim-tree/nvim-tree.lua'

    --fuzzy
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }

    --buffers
    --    use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }

    --appearance
    use 'chriskempson/base16-vim'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'

    --lsp / autoformat
    use { 'williamboman/mason.nvim', run = ':MasonUpdate' }
    use { 'neovim/nvim-lspconfig', requires = {"williamboman/mason-lspconfig.nvim", "Hoffs/omnisharp-extended-lsp.nvim"} }

    --dap - debugger
    use 'mfussenegger/nvim-dap'

    --cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'


    --terminal
    -- use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    --     require("toggleterm").setup()
    -- end }

    --autclose brackets
    use { 'm4xshen/autoclose.nvim', config = function()
        require('autoclose').setup()
    end }
end)
