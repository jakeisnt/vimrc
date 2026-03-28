-- oil.nvim: edit the filesystem like a buffer
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
    })
    vim.keymap.set("n", "<leader>.", require("oil").open, { desc = "Open oil (file browser)" })
  end,
}
