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

-- set nord theme
require'nord'.set()

-- telescope; defer ui select ot telescope
require'telescope'.setup {
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown { } }
  }
}
require'telescope'.load_extension'ui-select'

require'gitsigns'.setup{}

-- set up rust tools, use coq for lsp
require'rust-tools'.setup(require'coq'.lsp_ensure_capabilities({}))

vim.opt.termguicolors = true
-- highlight color names inline
require'colorizer'.setup({
  'css';
  'javascript';
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

require'nvim-autopairs'.setup{}
require'trouble'.setup{}
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
  -- TODO keybindings
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gd",
        list_definitions = "gD",
        list_definitions_toc = "gO",
      },
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
}
