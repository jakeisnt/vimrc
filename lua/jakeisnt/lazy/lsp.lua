-- Adapted from a combo of
-- https://lsp-zero.netlify.app/v3.x/blog/theprimeagens-config-from-2022.html
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    -- { "ms-jpq/coq_nvim", branch = "coq" },

    -- 9000+ Snippets
    -- { "ms-jpq/coq.artifacts", branch = "artifacts" },

    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**
    -- { 'ms-jpq/coq.thirdparty', branch = "3p" }
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

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    -- this is the function that loads the extra snippets to luasnip
    -- from rafamadriz/friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer", keyword_length = 3 },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    })

    local on_attach = function(client, buffer)
      vim.keymap.set("n", "<leader>l,", vim.diagnostic.goto_prev, { buffer = buffer })
      vim.keymap.set("n", "<leader>l;", vim.diagnostic.goto_next, { buffer = buffer })
      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = buffer })
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = buffer })
      vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { buffer = buffer })
      vim.keymap.set("n", "<leader>lm", vim.lsp.buf.rename, { buffer = buffer })
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { buffer = buffer })
      vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, { buffer = buffer })
      vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { buffer = buffer })
      vim.keymap.set("n", "<leader>lR", "<cmd>LspRestart<cr>", { buffer = buffer })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buffer })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buffer })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = buffer })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = buffer })
      vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { buffer = buffer })
      vim.keymap.set("n", "<space>gh", vim.lsp.buf.signature_help, { buffer = buffer })

      -- Use 'client.server_capabilities' for modern Neovim
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = buffer,
          callback = function()
            vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
          end,
        })
      end
    end

    local lspconfig = require("lspconfig")

    local installed = {
      "clangd",
      "pyright",
      "hls",
      "ocamllsp",
      "zls",
      "nil",
      "racket_langserver",
      "clojure_lsp",
      "eslint",
    }

    local function setup_servers()
      for _, server in pairs(installed) do
        local config = { root_dir = lspconfig.util.root_pattern({ ".git/", "." }) }
        config.on_attach = on_attach
        lspconfig[server].setup(config)
      end
    end

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    })

    setup_servers()
  end,
}
