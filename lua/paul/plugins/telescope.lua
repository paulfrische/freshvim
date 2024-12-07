local icons = require('paul.icons')

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    'nvim-telescope/telescope-ui-select.nvim',
  },

  event = 'VeryLazy',

  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          '.git',
        },
      },
      extensions = {
        ['ui-select'] = {},
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    local ok, err = pcall(telescope.load_extension, 'fzf')
    if not ok then
      print(err)
    end

    telescope.load_extension('ui-select')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Fuzzy Find Files ' .. icons.FILES })
    vim.keymap.set('n', '<leader>s', builtin.live_grep, { desc = 'Grep String ' .. icons.FILES })
    vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Grep String ' .. icons.FILES })
  end,
}
