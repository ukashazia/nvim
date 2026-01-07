return {
  'folke/tokyonight.nvim',
  enabled = false,
  priority = 2000,
  opts = {},
  config = function()
    require('tokyonight').setup {
      style = 'night', -- Options: "storm", "night", "moon"
      transparent = false, -- Enable transparent background
      terminal_colors = true, -- Use colors in Neovim terminal
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = 'dark', -- Set sidebars to darker background
      },
      sidebars = { 'qf', 'help' }, -- Sidebar windows for darker background
    }
  end,
}
