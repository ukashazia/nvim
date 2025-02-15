return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
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
