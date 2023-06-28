require 'nvim-treesitter.configs'.setup {
    ensure_installed = {'rust','lua','go','c'},
    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
    },

    incremental_selection = {
        enable = true,
    },

    indent = {
        enable = true,
    }
}
