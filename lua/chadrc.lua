local utils = require('utils.core')

local is_background_transparent = function()
  if utils.get_system() == 'osx' then
    return false
  end

  return true
end

local M = {
  base46 = {
    theme = "catppuccin",
    transparency = is_background_transparent(),
    hl_override = {
      Comment = { italic = true },
      ["@comment"] = { italic = true },
    },
  },
  ui = {
    cmp = {
      icons_left = true,
      lspkind_text = true,
      style = "default",
      format_colors = {
        tailwind = false,
        icon = "󱓻",
      },
    },

    telescope = { style = "bordered", load_on_startup = false },

    statusline = {
      enabled = true,
      theme = "default",
      separator_style = "default",
      order = nil,
      modules = nil,
    },
  },

  nvdash = {
    load_on_startup = false,
  },

  lsp = { signature = true },

  colorify = {
    enabled = true,
    mode = "virtual",
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}
return M
