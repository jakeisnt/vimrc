local buf_nmap = U.keymap.buf_nmap
local function lua_nmap(lhs, rhs, opts)
  buf_nmap(lhs, "<cmd>lua  " .. rhs .. "<CR>", opts)
end

-- All of these are buffer mappings
local function mappings()
  lua_nmap("<leader>l,", "vim.diagnostic.goto_prev()")
  lua_nmap("<leader>l;", "vim.diagnostic.goto_next()")
  lua_nmap("<leader>la", "vim.lsp.buf.code_action()")
  lua_nmap("<leader>lf", "vim.lsp.buf.formatting()")
  lua_nmap("<leader>lh", "vim.lsp.buf.hover()")
  lua_nmap("<leader>lm", "vim.lsp.buf.rename()")
  lua_nmap("<leader>lr", "vim.lsp.buf.references()")
  lua_nmap("<leader>ls", "vim.lsp.buf.document_symbol()")
  buf_nmap("<leader>li", "<cmd>LspInfo<cr>")
  buf_nmap("<leader>lr", "<cmd>LspRestart<cr>")
  lua_nmap("gd", "vim.lsp.buf.definition()")
  lua_nmap("gD", "vim.lsp.buf.declaration()")
  lua_nmap("gi", "vim.lsp.buf.implementation()")
  lua_nmap("gr", "vim.lsp.buf.references()")
  lua_nmap("ca", "vim.lsp.buf.code_action()")
  lua_nmap("<space>gh", "vim.lsp.buf.signature_help()")
end

return function(client)
  mappings()
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]])
  end
end
