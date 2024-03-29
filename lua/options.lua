vim.cmd [[ function! g:SyntaxGroup() abort
    let l:s = synID(line('.'), col('.'), 1) 
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction       
nnoremap <F12> :call SyntaxGroup()<CR> 
]]
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

opt.clipboard = 'unnamed'

opt.syntax = "on"
opt.termguicolors = true

--colorscheme
vim.cmd [[ silent! let base16colorspace=256]]
vim.cmd [[ silent!
    colorscheme base16-chalk
]]

vim.lsp.set_log_level("debug")
--

opt.updatetime = 50

vim.cmd [[ set clipboard+=unnamedplus]]

opt['guicursor'] = ""

--clear jumps

vim.cmd [[ au VimEnter * exe 'tabdo windo clearjumps' | tabnext ]]

--


--undo
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true

--mappings
vim.keymap.set('n', '<Space><Tab>', '<Cmd>b#<CR>')
vim.keymap.set('n', '<Home>', '^')
vim.keymap.set('n', '<End>', '$')


--plugins START
vim.keymap.set('n', '<C-CR>', ':Telescope<CR>')
--vim.keymap.set('n', '<C-`>', ':ToggleTerm<CR>')
--
--
----cargo run
--vim.keymap.set('n', 'cr', ':TermExec cmd="cargo run"<CR>')
--vim.keymap.set('n', 'cm', ':TermExec cmd="cargo check"<CR>')
--vim.keymap.set('n', 'ct', ':TermExec cmd="cargo test"<CR>')
--
--vim.keymap.set('n', 'c;', '<Cmd>TermExec cmd="<C-c>"<CR>')
--plugins END


vim.keymap.set('n', '<C-h>', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-l>', ':call setqflist([])<CR>')

vim.keymap.set('v', "K", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "J", ":m '<-2<CR>gv=gv")


--window resize
vim.keymap.set("n", "<C-0>", ':vertical resize +5<CR>')   -- make the window biger vertically
vim.keymap.set("n", "<C-9>", ':vertical resize -5<CR>')   -- make the window smaller vertically
vim.keymap.set("n", "<A-0>", ':horizontal resize +2<CR>') -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "<A-9>", ':horizontal resize -2<CR>') -- make the window smaller horizontally by pressing shift and -
