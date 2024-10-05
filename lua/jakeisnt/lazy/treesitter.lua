return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = "all",
      highlight = { enable = true },
      indent = { enable = true },
      autopairs = { enable = true },
      rainbow = { enable = true },
      autotag = { enable = true },
      context_commentstring = { enable = true },
      refactor = {
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gd",
            list_definitions = "gD",
          },
        },
      },
    })
  end
}
