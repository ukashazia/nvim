return {
  "aileot/ex-colors.nvim",
  lazy = true,
  cmd = "ExColors",
  config = function()
    require("ex-colors").setup({
      --- The output directory path. The path should end with `/colors` on any
      --- path included in `&runtimepath`.
      ---@type string
      colors_dir = vim.fn.stdpath("config") .. "/colors",
      --- If true, outputs will contains `:highlight-clear`.
      --- If you change multiple colorschemes during an nvim session, you should
      --- enable this option to override all the definitions previously applied
      --- colorscheme; otherwise, some highlights might be strangely mixed up.
      --- See also `reset_syntax` option.
      ---@type boolean
      clear_highlight = false,
      --- If true, outputs will contains `:syntax-reset`.
      --- If you change multiple colorschemes during an nvim session, you should
      --- enable this option to override all the definitions previously applied
      --- colorscheme; otherwise, some highlights might be strangely mixed up.
      --- See also `clear_highlight` option.
      ---@type boolean
      reset_syntax = false,
      --- If true, highlight definitions cleared by `:highlight clear` will not be
      --- included in the output. See `:h highlight-clear` for details.
      ---@type boolean
      ignore_clear = true,
      --- If true, omit `default` keys from the output highlight definitions.
      --- See `:h highlight-default` for the details.
      ---@type boolean
      omit_default = true,
      --- (For advanced users only) Return false to discard hl-group.
      ---@type fun(hl_name: string): string|false
      relinker = require("ex-colors.presets").recommended.relinker,
      --- A list of syntax names. Some colorscheme plugins define
      --- filetype-specific syntax highlight groups only on "Syntax" autocmd event
      --- for performance reasons. This option makes sure such lazily-loaded
      --- syntax highlight groups are defined before collecting them.
      ---@type string[]
      required_syntaxes = {
        "diff", -- "diffAdded", "diffRemoved", "diffChanged"
        "html",
        "markdown",
      },
      --- Highlight group names which should be included in the output.
      ---@type string[]
      included_hlgroups = require("ex-colors.presets").recommended.included_hlgroups,
      --- Highlight group name Lua patterns which should be included in the output.
      ---@type string[]
      included_patterns = require("ex-colors.presets").recommended.included_patterns,
      --- Highlight group names which should be excluded in the output.
      ---@type string[]
      excluded_hlgroups = require("ex-colors.presets").recommended.excluded_hlgroups,
      --- Highlight group name patterns which should be excluded in the output.
      ---@type string[]
      excluded_patterns = require("ex-colors.presets").recommended.excluded_patterns,
      --- Highlight group name patterns which should be only defined on the
      --- autocmd event patterns.
      ---@type table<string,string[]>
      autocmd_patterns = {},
      --- Vim global options (`&g:foobar` or `vim.go.foobar`) which should be also
      --- embedded in the colorscheme output to be updated at the same time.
      ---@type string[]
      embedded_global_options = {
        "background",
      },
      --- Vim global variables (`g:foobar` or `vim.g.foobar`) which should be also
      --- embedded in the colorscheme output to be updated at the same time.
      ---@type string[]
      embedded_global_variables = {
        "terminal_color_0",
        "terminal_color_1",
        "terminal_color_2",
        "terminal_color_3",
        "terminal_color_4",
        "terminal_color_5",
        "terminal_color_6",
        "terminal_color_7",
        "terminal_color_8",
        "terminal_color_9",
        "terminal_color_10",
        "terminal_color_11",
        "terminal_color_12",
        "terminal_color_13",
        "terminal_color_14",
        "terminal_color_15",
      },
    })
  end
}
