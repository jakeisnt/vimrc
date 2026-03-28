-- Cursor-style inline ghost-text AI autocomplete
return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  opts = {
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<C-]>",
      accept_word = "<C-j>",
    },
    ignore_filetypes = { "TelescopePrompt", "neo-tree" },
    color = {
      suggestion_color = "#6c7086", -- muted ghost text
    },
    log_level = "off",
    disable_inline_completion = false,
    disable_keymaps = false,
  },
}
