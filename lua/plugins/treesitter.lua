return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        -- install_dir = vim.fn.stdpath('data') .. '/treesitter',
        ensure_installed = 'all',
        auto_install = true,
        highlight = { enable = true, use_languagetree = true },
        -- incremental_selection = {
        --   enable = true,
        --   keymaps = {
        --     init_selection = "gnn", -- set to `false` to disable one of the mappings
        --     node_incremental = "grn",
        --     scope_incremental = "grc",
        --     node_decremental = "grm",
        --   },
        -- },
        indent = { enable = true },
        ignore_install = {},
        modules = {},
        sync_install = false,
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
    branch = 'master',
    opts = {
      max_lines = 5,
      trim_scope = 'outer'
    },
    event = 'BufRead'
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = 'master'
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    enabled = false
  }
}
