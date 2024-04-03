local icons = require('common.icons')

return {
  'paulfrische/compile.nvim',
  keys = {
    { '<leader>c', '<cmd>Compile<cr>', desc = 'Compile Code ' .. icons.PLUGIN },
  },
  opts = {
    type = 'float',
  },
}
