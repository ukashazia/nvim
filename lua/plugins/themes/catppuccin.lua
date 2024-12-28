return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {     -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
      term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false,              -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,            -- percentage of the shade to apply to the inactive window
      },
      no_italic = false,              -- Force no italic
      no_bold = false,                -- Force no bold
      no_underline = false,           -- Force no underline
      styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },      -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {
        mocha = {
          base = "#11111a",
          mantle = "#11111a",
          crust = "#11111a",
          --   base = "#0b0b12",
          --   mantle = "#11111a",
          --   crust = "#191926",
        },
      },
      custom_highlights = {},
      default_integrations = true,
      integrations = {
        blink_cmp = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,

        telescope = {
          enabled = true,
        },
        diffview = true,
        mason = true,
        copilot_vim = true,
        lsp_trouble = true,
        barbecue = {
          dim_dirname = false, -- directory name is dimmed by default
          bold_basename = true,
          dim_context = true,
          alt_background = false,
        },
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        treesitter_context = true,
        which_key = true,
        markdown = true,
      },
    })
  end
}
