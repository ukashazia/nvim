return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {},
  config = function()
    require("bufferline").setup {}
  end
}
