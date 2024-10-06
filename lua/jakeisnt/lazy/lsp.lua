-- Adapted from a combo of
-- https://lsp-zero.netlify.app/v3.x/blog/theprimeagens-config-from-2022.html
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    { "ms-jpq/coq_nvim", branch = "coq" },

    -- 9000+ Snippets
    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
    -- - shell repl
    -- - nvim lua api
    -- - scientific calculator
    -- - comment banner
    -- - etc
  },
  init = function()
    vim.g.coq_settings = {
        auto_start = true, -- if you want to start COQ at startup
        -- Your COQ settings here
    }
  end,
  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    require("fidget").setup({})
    require("mason").setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        -- "tsserver",
        "lua_ls",
        -- "ruff"
      },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
          })
        end,
        lua_ls = function()
          require('lspconfig').lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = {
                  version = 'LuaJIT'
                },
                diagnostics = {
                  globals = { 'vim', 'love' },
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  }
                }
              }
            }
          })
        end
      }
    })

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    -- this is the function that loads the extra snippets to luasnip
    -- from rafamadriz/friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
      },
      mapping = cmp.mapping.preset.insert({
        -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ['<C-Space>'] = cmp.mapping.complete(),
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    })
  end
}

-- TODO: from my old config. Use some of these?
-- local buf_nmap = U.keymap.buf_nmap
-- local function lua_nmap(lhs, rhs, opts)
--   buf_nmap(lhs, "<cmd>lua  " .. rhs .. "<CR>", opts)
-- end
--
-- -- All of these are buffer mappings
-- local function mappings()
--   lua_nmap("<leader>l,", "vim.diagnostic.goto_prev()")
--   lua_nmap("<leader>l;", "vim.diagnostic.goto_next()")
--   lua_nmap("<leader>la", "vim.lsp.buf.code_action()")
--   lua_nmap("<leader>lf", "vim.lsp.buf.formatting()")
--   lua_nmap("<leader>lh", "vim.lsp.buf.hover()")
--   lua_nmap("<leader>lm", "vim.lsp.buf.rename()")
--   lua_nmap("<leader>lr", "vim.lsp.buf.references()")
--   lua_nmap("<leader>ls", "vim.lsp.buf.document_symbol()")
--   buf_nmap("<leader>li", "<cmd>LspInfo<cr>")
--   buf_nmap("<leader>lr", "<cmd>LspRestart<cr>")
--   lua_nmap("gd", "vim.lsp.buf.definition()")
--   lua_nmap("gD", "vim.lsp.buf.declaration()")
--   lua_nmap("gi", "vim.lsp.buf.implementation()")
--   lua_nmap("gr", "vim.lsp.buf.references()")
--   lua_nmap("ca", "vim.lsp.buf.code_action()")
--   lua_nmap("<space>gh", "vim.lsp.buf.signature_help()")
-- end
--
-- return function(client)
--   mappings()
--   if client.resolved_capabilities.document_formatting then
--     vim.cmd([[autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]])
--   end
-- end

-- local lspconfig = require("lspconfig")
-- local on_attach = require("plugin.nvim-lspconfig.on-attach")
--
-- local installed = {
--   "clangd",
--   "pyright",
--   "sumneko_lua",
--   "hls",
--   "ocamllsp",
--   "zls",
--   "rnix",
--   "racket_langserver",
--   "clojure_lsp",
-- }
--
-- local function setup_servers()
--   for _, server in pairs(installed) do
--     local config = { root_dir = lspconfig.util.root_pattern({ ".git/", "." }) }
--     config.on_attach = on_attach
--     lspconfig[server].setup(config)
--   end
-- end
--
-- setup_servers()
