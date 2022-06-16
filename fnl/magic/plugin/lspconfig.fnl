(module magic.plugin.lspconfig
  {autoload {util magic.util
             nvim aniseed.nvim}})

(defn- map [from to]
  (util.nnoremap from to))

(local servers [
  "clangd"
  "pyright"
  "sumneko_lua"
  "clojure_lsp"
  "hls"
  "ocamllsp"
  "zls"
  "tsserver"
  "rnix"
  "racket_langserver"
  "clojure_lsp"])


;; TODO: reimplement this ( https://github.com/jakeisnt/vimrc/blob/main/lua/plugin/nvim-lspconfig/init.lua#L17 )
(let [(ok? lsp) (pcall #(require :lspconfig))]
  (when ok?

    ;; set up each config with  a proper root directory pattern
    (each [_ server (ipairs servers)]
      (let [config {:root_dir (lspconfig.util.root_pattern [".git/" "."])}]
        (lsp[server].setup config)))

    (lsp.sumneko_lua.setup
      {:cmd ["lua-language-server"]
       :settings {:Lua {:telemetry {:enable false}}}})

    ;; TODO implement all of my keymappings here: https://github.com/jakeisnt/vimrc/blob/main/lua/plugin/nvim-lspconfig/on-attach.lua

    ;; https://www.chrisatmachine.com/Neovim/27-native-lsp/
    (map :gd "lua vim.lsp.buf.definition()")
    (map :gD "lua vim.lsp.buf.declaration()")
    (map :gr "lua vim.lsp.buf.references()")
    (map :gi "lua vim.lsp.buf.implementation()")
    (map :K "lua vim.lsp.buf.hover()")
    (map :<c-k> "lua vim.lsp.buf.signature_help()")
    (map :<leader>l, "lua vim.diagnostic.goto_prev()")
    (map "<leader>l;" "lua vim.diagnostic.goto_next()")
    (map :<leader>lr "lua vim.lsp.buf.rename()")
    (map :<leader>lf "lua vim.lsp.buf.formatting()")

    ;; if we can format the document then 
    (when client.resolved_capabilities.document_formatting
      (vim.cmd "autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)"))))
