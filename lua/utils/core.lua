local M

M = {
  is_headless = function()
    if #vim.api.nvim_list_uis() == 0 then
      return true
    else
      return false
    end
  end
}

return M
