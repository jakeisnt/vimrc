-- Modern completion engine replacing nvim-cmp
return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      -- <Tab> is reserved for supermaven ghost-text; use <CR> or <C-y> to accept LSP completions
      ["<Tab>"] = {},
      ["<CR>"] = { "accept", "fallback" },
    },
    appearance = { nerd_font_variant = "mono" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    signature = { enabled = true },
  },
}
