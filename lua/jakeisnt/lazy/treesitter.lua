return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-refactor"
  },
  config = function()

    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = "all",
      highlight = { enable = true },
      indent = { enable = true },
      autopairs = { enable = true },
      rainbow = { enable = true },
      refactor = {
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gd",
            list_definitions = "gD",
          },
        },
        highlight_definitions = {
          enable = true,
          -- Set to false if you have an `updatetime` of ~100.
          clear_on_cursor_move = true,
        },
        highlight_current_scope = { enable = true },
        smart_rename = {
          enable = true,
          -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
          keymaps = {
            smart_rename = "grr",
          },
        },
      },
    })

    -- TODO: Define TextObject configuration:
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    -- require('nvim-treesitter-textobjects').setup()
    require('nvim-ts-autotag').setup({
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
      },
      -- Also override individual filetype configs, these take priority.
      -- Empty by default, useful if one of the "opts" global settings
      -- doesn't work well in a specific filetype
      per_filetype = {
        ["html"] = {
          enable_close = false
        }
      }
    })
  end,
}
