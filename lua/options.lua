local opt = vim.opt

opt.backspace = '2'
opt.showmatch = true
opt.ignorecase = true

opt.hlsearch = false
opt.incsearch = true

opt.autoindent = true

opt.number = true
opt.relativenumber = true
opt.scrolloff = 8

opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.mouse = 'a'
opt.swapfile = false

opt.termguicolors = true
opt.background = 'dark'
vim.g.zenbones_compat = 1
vim.cmd[[ colorscheme zenbones ]]

opt.updatetime = 50






--mappings

--plugins START
vim.keymap.set('n','<C-n>',':NvimTreeToggle<CR>')
vim.keymap.set('n','<C-CR>',':Telescope<CR>')
--plugins END

--tabs
--vim.keymap.set('n','<A-Right>',':bnext<CR>')
--vim.keymap.set('n','<A-Left>',':bprevious<CR>')

vim.keymap.set('n','<C-h>',':nohlsearch<CR>')
vim.keymap.set('n','<C-l>',':call setqflist([])<CR>')

vim.keymap.set('v', "K", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "J", ":m '<-2<CR>gv=gv")
