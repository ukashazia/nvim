return {
  "nvim-tree/nvim-tree.lua",
  enabled = false,
  config = function()
    require("nvim-tree").setup {
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        side = "right",
        width = 55,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        enable = true,
        git_ignored = false,
        custom = {},
        dotfiles = false,
      },
    }
  end,
}
