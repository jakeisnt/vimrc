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

g.coq_settings = { auto_start = true }

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

-- escape from toggleterm
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
