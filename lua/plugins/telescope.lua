local ignored_glob_patterns = {
  "--glob=!**/.git/**",
  "--glob=!**/.elixir-tools/**",
  "--glob=!**/.idea/*",
  "--glob=!**/.vscode/*",
  "--glob=!**/*build/*",
  "--glob=!**/dist/*",
  "--glob=!**/node_modules/*",
  "--glob=!**/*.lock*",
  "--glob=!**/*-lock*",
  "--glob=!**/.lexical*",
  "--glob=!*elixir_ls*",
  "--glob=!**/deps/**",

  "--glob=!**/*.png",
  "--glob=!**/*.jpeg",
  "--glob=!**/*.jpg",
  "--glob=!**/*.ttf",
  "--glob=!**/*.woff",
  "--glob=!**/*.woff2",
  "--glob=!**/*.gif",
  "--glob=!**/*.pdf",
  "--glob=!**/*.zip",
  "--glob=!**/*.tar",
  "--glob=!**/*.gz",
  "--glob=!**/*.webp",
}

return {
  {
    'nvim-telescope/telescope.nvim',
    event = "VimEnter",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--smart-case",
          "--hidden",
          "--unrestricted",
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
            "--unrestricted",  -- Search all files, including hidden and binary files

            -- Exclude some patterns from search
            -- LSP errors are due to mismatched lua versions (nvim uses an embedded version of lua that is different from the system version)
            unpack(ignored_glob_patterns),
          },
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
              -- LSP errors are due to mismatched lua versions (nvim uses an embedded version of lua that is different from the system version)
              unpack(ignored_glob_patterns),
            },
          },
          live_grep = {
            hidden = true,
            -- needed to exclude some files & dirs from general search
            -- when not included or specified in .gitignore
            find_command = {
              "rg",
              "--hidden",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case",
              "--unrestricted",
              -- LSP errors are due to mismatched lua versions (nvim uses an embedded version of lua that is different from the system version)
              unpack(ignored_glob_patterns),
            },
          },
        },

        extensions_list = { 'themes', 'terms', 'file_browser', "neoclip" },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          },
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
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    dependencies = { "nvim-telescope/telescope.nvim" }
  },
  {
    'prochri/telescope-all-recent.nvim',
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
      -- optional, if using telescope for vim.ui.select
      "stevearc/dressing.nvim"
    },
    config = function()
      require 'telescope-all-recent'.setup {
        database = {
          folder = vim.fn.stdpath("data"),
          file = "telescope-all-recent.sqlite3",
          max_timestamps = 10,
        },
        debug = false,
        scoring = {
          recency_modifier = {                 -- also see telescope-frecency for these settings
            [1] = { age = 240, value = 100 },  -- past 4 hours
            [2] = { age = 1440, value = 80 },  -- past day
            [3] = { age = 4320, value = 60 },  -- past 3 days
            [4] = { age = 10080, value = 40 }, -- past week
            [5] = { age = 43200, value = 20 }, -- past month
            [6] = { age = 129600, value = 10 } -- past 90 days
          },
          -- how much the score of a recent item will be improved.
          boost_factor = 0.0001
        },
        default = {
          disable = true,    -- disable any unkown pickers (recommended)
          use_cwd = true,    -- differentiate scoring for each picker based on cwd
          sorting = 'recent' -- sorting: options: 'recent' and 'frecency'
        },
        pickers = {          -- allows you to overwrite the default settings for each picker
          man_pages = {      -- enable man_pages picker. Disable cwd and use frecency sorting.
            disable = false,
            use_cwd = false,
            sorting = 'frecency',
          },

          -- change settings for a telescope extension.
          -- To find out about extensions, you can use `print(vim.inspect(require'telescope'.extensions))`
          ['extension_name#extension_method'] = {
            -- [...]
          }
        }
      }
    end
  }
}
