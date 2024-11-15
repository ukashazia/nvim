pcall(function()
  dofile(vim.g.base46_cache .. 'syntax')
  dofile(vim.g.base46_cache .. 'treesitter')
end)

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'vim',
        'lua',
        'vimdoc',
        'html',
        'css',
        'eex',
        'elixir',
        'erlang',
        'heex',
        'html',
        'surface',
        'javascript',
        'typescript',
        'java',
        'python',
        'c',
        'cpp',
      },
      auto_install = true,  -- Automatically installs missing parsers without prompts
      highlight = { enable = true, use_languagetree = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  { 'nvim-treesitter/nvim-treesitter-context', opts = {}, event = 'BufRead' },
}
