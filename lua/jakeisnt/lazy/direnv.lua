return {
  "direnv/direnv.vim",
  version = "*",
  lazy = false,
  config = function()
    vim.cmd([[runtime plugin/direnv.vim]])
  end,
}
