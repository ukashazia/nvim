local test = 5
local new = test + 5

return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'lewis6991/async.nvim',
  },
  lazy = false,
  config = function()
    require('refactoring').setup {}
  end,
}
