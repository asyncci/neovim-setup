require('barbar').setup{
  animation = false,
  maximum_padding = 7,
  minimum_padding = 5,

  maximum_length = 30,
  minimum_length = 0,

}

local function mapping(keys, command)
  vim.keymap.set('n',keys,command,{noremap = true, silent = true})
end

mapping('<A-[>',':BufferPrevious<CR>')
mapping('<A-]>',':BufferNext<CR>')

mapping('<A-{>',':BufferMovePrevious<CR>')
mapping('<A-}>',':BufferMoveNext<CR>')

mapping('<A-;>',':BufferPin<CR>')
mapping('<A-c>',':BufferClose<CR>')
