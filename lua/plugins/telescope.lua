local ignored_glob_patterns = {
  "--glob=!**/.git/*",
  "--glob=!**/.idea/*",
  "--glob=!**/.vscode/*",
  "--glob=!**/build/*",
  "--glob=!**/dist/*",
  "--glob=!**/node_modules/*",
  "--glob=!**/*.lock*",
  "--glob=!**/lexical*",
  "--glob=!*elixir_ls*",
}

return {
  {
    'nvim-telescope/telescope.nvim',
    event = "VimEnter",
    -- tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          -- "--column",
          "--smart-case",
          "--hidden",
        },
        defaults = {
          prompt_prefix = '   ',
          selection_caret = ' ',
          entry_prefix = ' ',
          sorting_strategy = 'ascending',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
          },
          vimgrep_arguments = {
            "rg",
            "--follow",        -- Follow symbolic links
            "--hidden",        -- Search for hidden files
            "--no-heading",    -- Don't group matches by each file
            "--with-filename", -- Print the file path with the matched lines
            "--line-number",   -- Show line numbers
            "--column",        -- Show column numbers
            "--smart-case",    -- Smart case search

            -- Exclude some patterns from search
            -- table.unpack(ignored_glob_patterns),
            ignored_glob_patterns,
          },
          -- file_ignore_patterns = {
          --   "node_modules", "build", "dist", ".lock"
          -- },
          -- mappings = {
          --   n = { ['q'] = require('telescope.actions').close },
          -- },
        },
        pickers = {
          find_files = {
            hidden = true,
            -- needed to exclude some files & dirs from general search
            -- when not included or specified in .gitignore
            find_command = {
              "rg",
              "--files",
              "--hidden",
              -- table.unpack(ignored_glob_patterns),
              ignored_glob_patterns,
            },
          },
        },

        extensions_list = { 'themes', 'terms', 'file_browser', "neoclip" },
        extensions = {
          file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- your custom insert mode mappings
              },
              ["n"] = {
                -- your custom normal mode mappings
              },
            },
          },
        },
      }
      require("telescope").load_extension "file_browser"
    end,
  },
  -- Telescope extensions

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
}
