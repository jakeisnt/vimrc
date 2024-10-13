return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true
    require("nvim-tree").setup({
      update_cwd = true,
      update_focused_file = { enable = true, update_cwd = true },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
    })

    vim.keymap.set("n", "<leader>.", ":NvimTreeOpen<CR>")
  end,
}
