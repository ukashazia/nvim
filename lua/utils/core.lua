local M

M = {
  is_headless = function()
    if #vim.api.nvim_list_uis() == 0 then
      return true
    else
      return false
    end
  end,

  -- Get the current operating system
  -- @return string
  get_system = function()
    local os = jit.os

    return string.lower(os)
  end
}

return M
