require('telescope').setup()

local builtin = require('telescope.builtin')
local utils = require('telescope.utils')


vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>cc', function() builtin.find_files({ cwd = utils.buffer_dir()}) end)
vim.keymap.set('n', '<leader>fg', builtin.git_files)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)


