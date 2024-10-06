return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local neogit = require("neogit")

    neogit.setup({
      disable_commit_confirmation = true,
      integrations = {
        diffview = true,
      },

      mappings = {
        status = {
          -- from the git menu,
          -- press 'return' to open diff view for a file
          -- TODO: Not recognized as a command
          -- ["<CR>"] = "DiffviewOpen",
        },
      },
    })

    vim.keymap.set("n", "<leader>gg", neogit.open)
  end,
}
