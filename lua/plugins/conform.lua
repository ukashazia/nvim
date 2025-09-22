return {
  'stevearc/conform.nvim',
  opts = {
    lsp_format = "prefer",
    formatters_by_ft = {
      -- elixir = { "mix_format" },
      -- heex = { "mix_format" },
      -- eelixir = { "mix_format" },
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    log_level = vim.log.levels.DEBUG,
    formatters = {
      mix_format = {
        command = "mix",
        args = { "format", "--stdin-filename", "$FILENAME" },
        stdin = true,
      }
    },
  },
}
