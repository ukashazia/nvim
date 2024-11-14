return {
  "Pocco81/auto-save.nvim",
  event = "BufRead",
  config = function()
    require("auto-save").setup {
      enabled = true,
      events = { "FocusLost", "TextChanged", "InsertLeave" },
      conditions = {
        exists = true,
        filetype_is_not = {},
        modifiable = true,
      },
      condition = function(buf)
        local fn = vim.fn
        local utils = require "auto-save.utils.data"

        if
            fn.getbufvar(buf, "&modifiable") == 1
            -- change here is adding harpoon file type to exclusion list
            and utils.not_in(fn.getbufvar(buf, "&filetype"), { "harpoon" })
        then
          return true
        end
        return false
      end,
    }
  end,
}
