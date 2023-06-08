require('nvim-tree').setup({
    view = {
        width = 30,
    },
    renderer = {
        icons = {
            git_placement = 'after',
            glyphs = {
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "r",
                    untracked = "?",
                    deleted = "-",
                    ignored = "",
                }
            }
        }
    }
})
