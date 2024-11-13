return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup {
      style = "storm", -- Options: "storm", "night", "moon"
      transparent = false, -- Enable transparent background
      terminal_colors = true, -- Use colors in Neovim terminal
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark", -- Set sidebars to darker background
      },
      sidebars = { "qf", "help" }, -- Sidebar windows for darker background
    }
  end,
}
