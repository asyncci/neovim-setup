local bufferline = require('bufferline')

bufferline.setup ({
    highlights = {
        buffer_selected = {
            italic = false,
        },
    },
    options = {
        style_preset = bufferline.style_preset.no_italic,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer" ,
                text_align = 'center',
                separator = false
            }
        },
        separator_style = "slant"
    },
})


vim.keymap.set('n', '<C-d>', '<CMD>BufferLinePickClose<CR>')
vim.keymap.set('n', '<A-Right>', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<A-Left>', '<CMD>BufferLineCyclePrev<CR>')
vim.keymap.set('n', "<A-'>", '<CMD>BufferLineMoveNext<CR>')
vim.keymap.set('n', '<A-;>', '<CMD>BufferLineMovePrev<CR>')
vim.keymap.set('n', 'gs', '<CMD>BufferLineSortByDirectory<CR>')
