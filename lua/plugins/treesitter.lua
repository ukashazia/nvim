-- pcall(function()
--   dofile(vim.g.base46_cache .. 'syntax')
--   dofile(vim.g.base46_cache .. 'treesitter')
-- end)

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = 'all',
      auto_install = true, -- Automatically installs missing parsers without prompts
      highlight = { enable = true, use_languagetree = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
      -- vim.wo.foldmethod = 'expr'
      -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {},
    event = 'BufRead'
  },
}
