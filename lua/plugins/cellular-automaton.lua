return {

"Eandrju/cellular-automaton.nvim",
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>fml" }
  },

config = function()
	require("cellular-automaton").setup {}
end,	
} 
