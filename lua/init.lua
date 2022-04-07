require("plugins")

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

  -- remove f from shortmess to show log messages
  vim.opt_global.shortmess:remove("F")
end

disable_default_plugins()
require("core.utils")
require("core.options")
require("core.keymaps")
require("core.autocmds")

vim.cmd([[runtime plugin/direnv.vim]])

-- set my theme
require("stilla").set()

-- telescope; defer ui select ot telescope
require("telescope").setup({
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
  },
})

require("telescope").load_extension("projects")

require("telescope").load_extension("ui-select")

-- change default git signs
require("gitsigns").setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "▎" },
    change = { hl = "GitSignsChange", text = "▎" },
    delete = { hl = "GitSignsDelete", text = "契" },
    topdelete = { hl = "GitSignsDelete", text = "契" },
    changedelete = { hl = "GitSignsChange", text = "▎" },
  },
})

-- highlight color names inline
vim.opt.termguicolors = true
require("colorizer").setup({
  "css",
  "javascript",
  "lua",
  html = { mode = "background" },
}, {
  RGB = true, -- #RGB hex codes
  RRGGBB = true, -- #RRGGBB hex codes
  names = true, -- "Name" codes like Blue
  RRGGBBAA = true, -- #RRGGBBAA hex codes
  rgb_fn = true, -- CSS rgb() and rgba() functions
  hsl_fn = true, -- CSS hs,l() and hsla() functions
  css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  mode = "background", -- Set the display mode. background / foreground
})

require("nvim-autopairs").setup({})
require("trouble").setup({})
require("lualine").setup({
  options = {
    theme = "stilla",
    icons_enabled = true,
    extensions = { "nvim-tree" },
    section_separators = "",
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    component_separators = "",
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "branch" },
    lualine_b = { "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "filetype" },
  },
})

require("neogit").setup({
  disable_commit_confirmation = true,
  integrations = {
    diffview = true,
  },

  mappings = {
    status = {
      ["<CR>"] = "DiffviewOpen",
    },
  },
})

g.coq_settings = { auto_start = true }

-- language server things / nvim-lsp things
-- set up rust tools, use coq for lsp
require("rust-tools").setup(require("coq").lsp_ensure_capabilities({}))

Metals_config = require("metals").bare_config()
Metals_config.init_options.statusBarProvider = "on"
Metals_config.settings.useGlobalExecutable = true

vim.cmd [[augroup lsp]]
vim.cmd [[au!]]
vim.cmd [[au FileType java,scala,sbt lua require("metals").initialize_or_attach(Metals_config)]]
vim.cmd [[augroup end]]

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint, -- eslint or eslint_d
    null_ls.builtins.code_actions.eslint, -- eslint or eslint_d
    null_ls.builtins.formatting.eslint, -- prettier, eslint, eslint_d, or prettierd
  },
})

local luadev = require("lua-dev").setup({})
require("lspconfig").sumneko_lua.setup(luadev)

-- local util = require "lspconfig/util"
-- require 'lspconfig'.tsserver.setup{
--     on_attach = function(client)
--         client.resolved_capabilities.document_formatting = false
--     end,
--     root_dir = util.root_pattern(".git", "tsconfig.json", "jsconfig.json"),
-- }

-- require 'lspconfig'.eslint.setup{ }

-- treesitter
require("nvim-treesitter.configs").setup({
  -- highlight = { enable = true },
  ensure_installed = "maintained",
  indent = { enable = true },
  autopairs = { enable = true },
  rainbow = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true },
  refactor = {
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gd",
        list_definitions = "gD",
      },
    },
  },
})

-- escape from toggleterm
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
