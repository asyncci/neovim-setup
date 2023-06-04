local opt = vim.opt

opt.backspace = '2'
opt.showmatch = true
opt.ignorecase = true

opt.hlsearch = false
opt.incsearch = true

opt.autoindent = true

opt.number = true
opt.scrolloff = 8

opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4 
opt.softtabstop = 4
opt.mouse = 'a'
opt.swapfile = false


vim.cmd [[silent! colorscheme gruvbox]]
vim.keymap.set('n','<C-h>',':nohlsearch<CR>')

-- nvim-tree
vim.keymap.set('n','<C-n>',':CHADopen<CR>')

vim.keymap.set('n','<C-l>',':call setqflist([])<CR>')
