return {
  "stevearc/conform.nvim",
  event = "BufWritePre", -- uncomment for format on save
  lazy = false,
  opts = {
    formatters_by_ft = {
      elixir = { "mix" },
      heex = { "mix" },
      eelixir = { "mix" },
      lua = {"prettier", "tylua" },
      -- Conform will run multiple formatters sequentially
      python = { "isort", "black" },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { "rustfmt", lsp_format = "fallback" },
      -- Conform will run the first available formatter
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
