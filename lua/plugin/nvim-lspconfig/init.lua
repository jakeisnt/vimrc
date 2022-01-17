local lspconfig = require('lspconfig')
local on_attach = require('plugin.nvim-lspconfig.on-attach')

local installed = { 'clangd', 'pyright', 'sumneko_lua', 'hls', 'ocamllsp', 'zls', 'tsserver', 'rnix', 'racket_langserver', 'clojure_lsp'}

local servers = {
  sumneko_lua = {
    cmd = {"lua-language-server"},
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}

local function setup_servers()
  for _, server in pairs(installed) do
    local config = servers[server] or {root_dir = lspconfig.util.root_pattern({'.git/', '.'})}
    config.on_attach = on_attach
    lspconfig[server].setup(config)
  end
end

setup_servers()
