return {
  "direnv/direnv.vim",
  version = "*",
  config = function()
    vim.cmd([[runtime plugin/direnv.vim]])
  end,
}
