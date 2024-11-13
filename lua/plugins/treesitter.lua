return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
        dotfiles = true,
      },

      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "elixir",
        "heex",
        "javascript",
        "typescript",
        "java",
        "python",
        "c",
        "cpp",
      },
    },
  },
  { "nvim-treesitter/nvim-treesitter-context", opts = {}, 


   event = "BufRead",

  },
}
