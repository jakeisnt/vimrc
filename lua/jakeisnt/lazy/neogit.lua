return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local neogit = require('neogit');

    neogit.setup({
      -- disable_commit_confirmation = true,
    })

    vim.keymap.set('n', '<leader>gg', neogit.open)
  end

};
