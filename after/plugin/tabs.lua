require('barbar').setup()

local function mapping(keys, command)
  vim.keymap.set('n',keys,command,{noremap = true, silent = true})
end

mapping('<A-[>',':BufferPrevious<CR>')
mapping('<A-]>',':BufferNext<CR>')

mapping('<A-{>',':BufferMovePrevious<CR>')
mapping('<A-}>',':BufferMoveNext<CR>')

mapping('<A-;>',':BufferPin<CR>')
mapping('<A-c>',':BufferClose<CR>')
