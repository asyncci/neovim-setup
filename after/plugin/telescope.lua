local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n','<A-/>',':Telescope<CR>')

