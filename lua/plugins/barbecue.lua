return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
  config = function()
    require('barbecue').setup {
      theme = 'catppuccin', -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    }
  end,
  opts = {
    -- configurations go here
  },
}
