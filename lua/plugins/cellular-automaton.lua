return {
  "Eandrju/cellular-automaton.nvim",
  event = "BufRead",
  config = function()
    require("cellular-automaton")
  end,
}
