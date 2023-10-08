--folding methods
vim.cmd [[ set foldlevel=20 ]]
vim.cmd [[ set foldmethod=expr]]
vim.cmd [[ set foldexpr=nvim_treesitter#foldexpr()]]
--

vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })
