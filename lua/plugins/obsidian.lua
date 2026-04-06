return {

  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
  daily_notes = {
    folder = nil,
    date_format = "%Y-%m-%d",
    default_tags = { "daily-notes" },
    workdays_only = false,
  },
    picker = {
      name = "snacks.pick"
    },
    workspaces = {
      {
        name = "dycoders",
        path = "~/dev/notes",
      },
    },
  },
}
