return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = { 'italic' },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {
        mocha = {
          base = '#11111a',
          mantle = '#11111a',
          crust = '#11111a',
        },
      },
      custom_highlights = function(colors)
        return {
          BlinkCmpMenu = { bg = colors.base },
          BlinkCmpMenuBorder = { bg = colors.base },
        }
      end,
      default_integrations = false,
      integrations = {
        blink_cmp = true,
        gitsigns = true,
        treesitter = true,
        telescope = { enabled = true },
        diffview = true,
        which_key = true,
        snacks = true,
        mini = { enabled = true },
        cmp = false,
        nvimtree = false,
        notify = false,
        mason = false,
        copilot_vim = false,
        lsp_trouble = false,
        barbecue = false,
        indent_blankline = { enabled = false },
        treesitter_context = false,
        alpha = false,
        dap = false,
        dap_ui = false,
        dashboard = false,
        dropbar = { enabled = false },
        flash = false,
        fzf = false,
        illuminate = false,
        lir = false,
        navic = { enabled = false },
        neogit = false,
        neotree = false,
        rainbow_delimiters = false,
        render_markdown = false,
        ufo = false,
        colorful_winsep = false,
      },
      compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
    }
    vim.cmd.CatppuccinCompile()
  end,
}
