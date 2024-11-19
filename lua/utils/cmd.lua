local M

return function(args_table)
  local callback = args_table.callback
  local cmd = args_table.cmd

  vim.cmd(cmd)

  if callback then
    callback()
  end
end
