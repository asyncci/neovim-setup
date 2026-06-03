local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then	
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    --local lazyrepo = "git@github.com:folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
    {
        "chriskempson/base16-vim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here

            vim.cmd [[ silent! let base16colorspace=256]]
            --colorscheme base16-chalk
            vim.cmd [[ silent!
    colorscheme zaibatsu
]]
        end,
    },

    { 'nvim-tree/nvim-tree.lua'},

    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-lualine/lualine.nvim' },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },


    { 'nvim-telescope/telescope.nvim',   dependencies = { 'nvim-lua/plenary.nvim' } },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },

    { 'williamboman/mason.nvim',  build = ':MasonUpdate' },
    { 'neovim/nvim-lspconfig',    priority = 1000,       dependencies = { "williamboman/mason-lspconfig.nvim", "Hoffs/omnisharp-extended-lsp.nvim" } },
    { 'simrat39/inlay-hints.nvim' },

    --zig
    { 'jinzhongjia/Zig.nvim' },
    --rust
    { 'simrat39/rust-tools.nvim' },

    --dap - debugger
    { 'nvim-lua/plenary.nvim' },

    --cmp
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },


    --terminal
    -- use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    --     require("toggleterm").setup()
    -- end }

    --autclose brackets
    {
        'm4xshen/autoclose.nvim',
        config = function()
            require('autoclose').setup()
        end
    },

    -- automatically check for plugin updates
    checker = { enabled = true },
})
