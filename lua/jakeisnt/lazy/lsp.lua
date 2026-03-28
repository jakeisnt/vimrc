return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "j-hui/fidget.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    require("fidget").setup({})

    -- Global handler for keymaps and inlay hints (Neovim 0.11 pattern)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local buf = ev.buf
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        vim.keymap.set("n", "<leader>l,", vim.diagnostic.goto_prev, { buffer = buf })
        vim.keymap.set("n", "<leader>l;", vim.diagnostic.goto_next, { buffer = buf })
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = buf })
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = buf })
        vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { buffer = buf })
        vim.keymap.set("n", "<leader>lm", vim.lsp.buf.rename, { buffer = buf })
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { buffer = buf })
        vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, { buffer = buf })
        vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { buffer = buf })
        vim.keymap.set("n", "<leader>lR", "<cmd>LspRestart<cr>", { buffer = buf })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buf })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = buf })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = buf })
        vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { buffer = buf })
        vim.keymap.set("n", "<space>gh", vim.lsp.buf.signature_help, { buffer = buf })

        if client and client.supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hints.enable(true, { bufnr = buf })
        end
      end,
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = {
      "clangd",
      "pyright",
      "hls",
      "ocamllsp",
      "zls",
      "nil_ls",
      "racket_langserver",
      "clojure_lsp",
      "eslint",
    }

    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
        root_markers = { ".git" },
      })
    end

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      root_markers = { ".git" },
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.enable(vim.list_extend(vim.list_extend({}, servers), { "lua_ls" }))
  end,
}
