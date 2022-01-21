require'plugins'

local g = vim.g

local function disable_default_plugins()
  g.loaded_gzip = 1
  g.loaded_tar = 1
  g.loaded_tarPlugin = 1
  g.loaded_zip = 1
  g.loaded_zipPlugin = 1
  g.loaded_getscript = 1
  g.loaded_getscriptPlugin = 1
  g.loaded_vimball = 1
  g.loaded_vimballPlugin = 1
  g.loaded_matchit = 1
  g.loaded_matchparen = 1
  g.loaded_2html_plugin = 1
  g.loaded_logiPat = 1
  g.loaded_rrhelper = 1
  g.loaded_netrw = 1
  g.loaded_netrwPlugin = 1
  g.loaded_netrwSettings = 1
  g.loaded_netrwFileHandlers = 1
end

disable_default_plugins()
require'core.utils'
require'core.options'
require'core.keymaps'
require'core.autocmds'

vim.cmd[[runtime plugin/direnv.vim]]

-- set nord theme
require'nord'.set()

-- telescope; defer ui select ot telescope
require'telescope'.setup {
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown { } }
  }
}

require'telescope'.load_extension'ui-select'

-- change default git signs
require'gitsigns'.setup {
  signs = {
    add = {hl = 'GitSignsAdd', text = '▎'},
    change = {hl = 'GitSignsChange', text = '▎'},
    delete = {hl = 'GitSignsDelete', text = '契'},
    topdelete = {hl = 'GitSignsDelete', text = '契'},
    changedelete = {hl = 'GitSignsChange', text = '▎'},
  },
}

-- highlight color names inline
vim.opt.termguicolors = true
require'colorizer'.setup({
  'css';
  'javascript';
  'lua';
  html = { mode = 'background' };
}, {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    mode     = 'background';  -- Set the display mode. background / foreground
  })

require'nvim-autopairs'.setup {}
require'trouble'.setup {}
require'lualine'.setup {
  options = {
    theme = 'nord',
    icons_enabled = true,
    extensions = { 'nvim-tree' },
    section_separators = '',
    component_separators = '',
  },
}


require'neogit'.setup {
  disable_commit_confirmation = true,
  integrations = {
    diffview = true
  },

  mappings = {
    status = {
      ["<CR>"] = "DiffviewOpen"
    }
  }
}

g.coq_settings = { auto_start = true }

-- language server things / nvim-lsp things
-- set up rust tools, use coq for lsp
require'rust-tools'.setup(require'coq'.lsp_ensure_capabilities({}))

local null_ls = require'null-ls'
null_ls.setup{
  sources = {
    null_ls.builtins.diagnostics.eslint, -- eslint or eslint_d
    null_ls.builtins.code_actions.eslint, -- eslint or eslint_d
    null_ls.builtins.formatting.eslint -- prettier, eslint, eslint_d, or prettierd
  },
}

local luadev = require'lua-dev'.setup{}
require'lspconfig'.sumneko_lua.setup(luadev)


-- treesitter
require'nvim-treesitter.configs'.setup {
  -- highlight = { enable = true },
  ensure_installed = 'maintained',
  indent = {enable = true},
  autopairs = {enable = true},
  rainbow = {enable = true},
  autotag = {enable = true},
  -- context_commentstring = {enable = true},
--   refactor = {
  --   highlight_definitions = { enable = true },
    -- highlight_current_scope = { enable = true },
  --   navigation = {
  --     enable = true,
   --    keymaps = {
    --     goto_definition = "gd",
     --    list_definitions = "gD",
   --    },
  --   },
 --  },
}
