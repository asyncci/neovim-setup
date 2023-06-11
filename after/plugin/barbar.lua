--bufferline
vim.keymap.set('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<A-Right>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
vim.keymap.set('n', '<A-;>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.keymap.set('n', "<A-'>", '<Cmd>BufferMoveNext<CR>', opts)

vim.keymap.set('n', '<C-d>', '<Cmd>BufferClose<CR>', opts)
vim.keymap.set('n', 'gs', '<Cmd>BufferOrderByDirectory<CR>', opts)


require('barbar').setup{
    animation = false,
    highlight_visible = false,
    tabpages = true,
    icons = {
        separator_at_end = false,
        separator = { left = "", right = ""},
        filetype = {
            enabled = false,
        },
    }
}
