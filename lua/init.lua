require'plugins'

local function disable_default_plugins()
  vim.g.loaded_gzip = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrwSettings = 1
  vim.g.loaded_netrwFileHandlers = 1
end

disable_default_plugins()
require'core.utils'
require'core.options'
require'core.keymaps'
require'core.autocmds'

vim.cmd[[runtime plugin/direnv.vim]]

require'nord'.set()
require'rust-tools'.setup{}
require'nvim-autopairs'.setup{}
require'lualine'.setup {
  options = {
    theme = 'nord',
    icons_enabled = true,
    extensions = { 'nvim-tree' },
    section_separators = '',
    component_separators = '',
  },
}

require'nvim-treesitter.configs'.setup {
  highlight = {enable = true},
  ensure_installed = 'maintained',
  indent = {enable = true},
  autopairs = {enable = true},
  rainbow = {enable = true},
  autotag = {enable = true},
  context_commentstring = {enable = true},
  refactor = {
    keymaps = {
      smart_rename = "grr",
    },
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
    },
  },
  textobjects = {
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["df"] = "@function.outer",
        ["dF"] = "@class.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    select = {
      enable = true,

      -- auto jump to next textobject
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }
    }
  }
}
