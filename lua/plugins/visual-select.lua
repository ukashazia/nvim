return {
  dir = '~/.config/nvim/lua/plugins/custom/visual-select.nvim',
  opts = {
    -- The highlight group to apply to matched text
    --
    hl_group = 'Search',
    -- The minimum number of selected characters required to trigger highlighting
    chars_lower_limit = 6,
    -- The maximum number of selected lines to trigger highlighting for
    lines_upper_limit = 30,
    -- By default, visimatch will highlight text even if it doesn't have exactly
    -- the same spacing as the selected region. You can set this to `true` if
    -- you're not a fan of this behaviour :)
    strict_spacing = false,
  },
}
