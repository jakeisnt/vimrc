local lspconfig = require("lspconfig")
local on_attach = require("plugin.nvim-lspconfig.on-attach")

local installed = {
  "clangd",
  "pyright",
  "sumneko_lua",
  "hls",
  "ocamllsp",
  "zls",
  "rnix",
  "racket_langserver",
  "clojure_lsp",
}

local function setup_servers()
  for _, server in pairs(installed) do
    local config = { root_dir = lspconfig.util.root_pattern({ ".git/", "." }) }
    config.on_attach = on_attach
    lspconfig[server].setup(config)
  end
end

setup_servers()
