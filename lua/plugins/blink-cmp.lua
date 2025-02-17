return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = {
      preset = 'none',


      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-l>'] = { 'select_and_accept', 'fallback' },
      ['<C-h>'] = { 'hide', 'fallback' },

      ['<C-d>'] = { 'show_documentation', 'fallback' },
      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-b>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_up', 'fallback' },

      -- -- show with a list of providers
      ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
    },

    cmdline = {
      keymap = {
        preset = "none",
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-l>'] = { 'select_and_accept', 'fallback' },
        ['<C-h>'] = { 'hide', 'fallback' },

        ['<C-d>'] = { 'show_documentation', 'fallback' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_up', 'fallback' },

        -- -- show with a list of providers
        ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
      },
    },

    signature = {
      window = {
        border = 'rounded',
      },
    },

    completion = {
      menu = {
        min_width = 30,
        max_height = 15,
        border = 'rounded',
        -- documenation = {
        --   window = {
        --     border = 'rounded',
        --   }
        -- },
        draw = {
          -- padding = 1,
          --   gap = 1,
          --   -- components = {
          --   --   kind_icon = {
          --   --     ellipsis = false,
          --   --     text = function(ctx)
          --   --       local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
          --   --       return kind_icon
          --   --     end,
          --   --     highlight = function(ctx)
          --   --       local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
          --   --       return hl
          --   --     end,
          --   --   },
          -- },
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = 'rounded' }
      },
      ghost_text = { enabled = false },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      -- add lazydev to your completion providers
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
  },
  opts_extend = { "sources.default" }
}
