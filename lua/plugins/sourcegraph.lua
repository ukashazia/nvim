return {
  "sourcegraph/sg.nvim",
  opts = {},
  config = function()
    require("sg").setup({})
  end,
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
}
