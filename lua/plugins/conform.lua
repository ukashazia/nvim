return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  ---

  config = function()
    require('conform').setup {
      lsp_format = 'fallback',
      default_format_opts = {
        lsp_format = 'fallback',
      },
      formatters_by_ft = {

        lua = { 'stylua' },
        -- Conform will run multiple formatters sequentially
        go = { 'goimports', 'gofmt' },
        -- You can also customize some of the format options for the filetype
        rust = { 'rustfmt', lsp_format = 'fallback' },
        -- You can use a function here to determine the formatters dynamically
        python = function(bufnr)
          if require('conform').get_formatter_info('ruff_format', bufnr).available then
            return { 'ruff_format' }
          else
            return { 'isort', 'black' }
          end
        end,
        elixir = { 'mix_format' },
        heex = { 'mix_format' },
        eelixir = { 'mix_format' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
      },
      log_level = vim.log.levels.DEBUG,
    }
  end,
}
