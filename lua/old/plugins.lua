local fn = vim.fn

  -- navigate code with respect to textobjects!
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- refactoring utils for treesitter
  use({
    "nvim-treesitter/nvim-treesitter-refactor",
    commit = "7470880adf8b6fd20936aad33f24ce8fecdb6799",
  })
  -- change comment string based on what's under cursor
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    commit = commit.nvim_ts_context_commentstring,
    event = "BufReadPost",
  })

  -- auto close and auto rename html tags
  -- use 'windwp/nvim-ts-autotag'

  -- super project integration
  use({
    "ahmedkhalf/project.nvim",
    commit = commit.project,
    config = function()
      require("project_nvim").setup({})
    end,
  })

  -- nvim lsp default configs
  use({ "neovim/nvim-lspconfig", commit = commit.nvim_lspconfig })
  -- js/ts specific language server stuff
  use({
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" },
  })

  -- incredible lisp editing experience in lua
  use({ "Olical/conjure", commit = "2717348d1a0687327f59880914fa260e4ad9c685" })

  -- status line
  use({ "nvim-lualine/lualine.nvim", commit = commit.lualine })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
      require("nvim-tree").setup({
        update_cwd = true,
        update_focused_file = { enable = true, update_cwd = true },
      })
    end,
  })

  -- autocomplete
  use({ "ms-jpq/coq_nvim", commit = commit.coq_nvim })
  -- snippets
  use({ "ms-jpq/coq.artifacts", commit = "3eaf9fba507dd01abcd4870221a636f0ecb8cde0" })

  use 'wakatime/vim-wakatime'
end)
