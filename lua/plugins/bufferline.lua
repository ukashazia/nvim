return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {},
  config = function()
    require("bufferline").setup {}
  end
}
