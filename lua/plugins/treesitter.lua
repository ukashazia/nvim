return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        auto_install = true,
        highlight = { enable = true, use_languagetree = true },
        indent = { enable = true },
        ignore_install = {},
        modules = {},
        sync_install = true,
        textobjects = {
          select = {
            enable = true,

            lookahead = true,

            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v',
              ['@function.outer'] = 'V',
              ['@class.outer'] = '<c-v>',
            },
            include_surrounding_whitespace = true,
          },
        },
      })

      -- vim.wo.foldmethod = 'expr'
      -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {},
    event = 'BufRead'
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          -- Defaults
          enable_close = true,          -- Auto close tags
          enable_rename = true,         -- Auto rename pairs of tags
          enable_close_on_slash = false -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          -- ["html"] = {
          --   enable_close = false
          -- }
        }
      })
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
  }
}
