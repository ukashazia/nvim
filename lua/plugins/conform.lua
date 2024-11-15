return {
  'stevearc/conform.nvim',
  lazy = false,
  config = function()
    require("conform").formatters.mix = {
      inherit = false,
      command = "mix",
      args = { "format", vim.api.nvim_buf_get_name(0) },
    }
  end,
  opts = {
    timeout = 10000,
    async = true,
    formatters_by_ft = {
      elixir = { "mix" },
      heex = { "mix" },
      eelixir = { "mix" },
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
