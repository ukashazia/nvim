return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = false,
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  config = function()
    require("ibl").setup {
      scope = { enabled = true },
    }
  end,
}
