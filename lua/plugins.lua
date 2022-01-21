local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local commit = {
  barbar = "6e638309efcad2f308eb9c5eaccf6f62b794bbab",
  cmp_buffer = "f83773e2f433a923997c5faad7ea689ec24d1785",
  cmp_luasnip = "d6f837f4e8fe48eeae288e638691b91b97d1737f",
  cmp_nvim_lsp = "ebdfc204afb87f15ce3d3d3f5df0b8181443b5ba",
  cmp_path = "c5230cb439df9547294678d0f1c1465ad7989e5f",
  comment = "90df2f87c0b17193d073d1f72cea2e528e5b162d",
  dapinstall = "568d946a99edb6780912cb39ca68c368516cd853",
  dashboard_nvim = "d82ddae95fd4dc4c3b7bbe87f09b1840fbf20ecb",
  fixcursorhold = "0e4e22d21975da60b0fd2d302285b3b603f9f71e",
  friendly_snippets = "d4f5c0507cfe4c67024f58c84ba982f7f5c71a7a",
  gitsigns = "f4648dcc055a10573f36e83343592824155ab466",
  lua_dev = "a0ee77789d9948adce64d98700cc90cecaef88d5",
  lualine = "70691ae350fdbe1f15758e3b8e2973742a7967a9",
  luasnip = "0222ee63c9e4b80e6000d064f8efd8edcc6d0c48",
  nlsp_settings = "3a3942b5d1da30e3ca0dc431aada3191c5952054",
  null_ls = "4d45075678db7442f4d78287efd11b08bd414bcd",
  nvim_autopairs = "97e454ce9b1371373105716d196c1017394bc947",
  nvim_cmp = "1797f9e1acd2e0b5b4b6805928aebc1dcc0ecbff",
  nvim_dap = "675e13a3f4dba3c33f04d4cf3b575d72bb7b8a4a",
  nvim_lsp_installer = "e1d00a5ebce4c62d6b4c13ad7de4d2faa750ba21",
  nvim_lspconfig = "37edd90592ef0e4b603634e449ce28b053d9bdd0",
  nvim_notify = "15f52efacd169ea26b0f4070451d3ea53f98cd5a",
  nvim_tree = "0a2f6b0b6ba558a88c77a6b262af647760e6eca8",
  nvim_treesitter = "d0158c053d01de1bcb618d7899bd8e38ce154430",
  nvim_ts_context_commentstring = "097df33c9ef5bbd3828105e4bee99965b758dc3f",
  nvim_web_devicons = "634e26818f2bea9161b7efa76735746838971824",
  packer = "7182f0ddbca2dd6f6723633a84d47f4d26518191",
  plenary = "563d9f6d083f0514548f2ac4ad1888326d0a1c66",
  popup = "b7404d35d5d3548a82149238289fa71f7f6de4ac",
  project = "cef52b8da07648b750d7f1e8fb93f12cb9482988",
  structlog = "6f1403a192791ff1fa7ac845a73de9e860f781f1",
  telescope = "0011b1148d3975600f5a9f0be8058cdaac4e30d9",
  telescope_fzf_native = "b8662b076175e75e6497c59f3e2799b879d7b954",
  toggleterm = "f23866b8fbb0703be4e15d50c814ffe496242a67",
  which_key = "28d2bd129575b5e9ebddd88506601290bb2bb221",
  coq_nvim = "0ab471648fd27943c49c28d7f22730ba0b14bdb8",
}

return require('packer').startup(function(use)
  -- should manage itself?
  use { "wbthomason/packer.nvim", commit = commit.packer }
  -- better highlighting and code interaction
  use { 'nvim-treesitter/nvim-treesitter', commit = commit.nvim_treesitter, run = ':TSUpdate' }
  -- navigate code with respect to textobjects!
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- refactoring utils for treesitter
  -- use 'nvim-treesitter/nvim-treesitter-refactor'
  -- change comment string based on what's under cursor
  use { 'JoosepAlviste/nvim-ts-context-commentstring', commit = commit.nvim_ts_context_commentstring, event = "BufReadPost" }


    -- lua dev
  use { "folke/lua-dev.nvim", commit = commit.lua_dev }
  -- auto close and auto rename html tags
 -- use 'windwp/nvim-ts-autotag'

  -- super project integration
  use {
    "ahmedkhalf/project.nvim",
    commit = commit.project,
    config = function()
        require'project_nvim'.setup{}
    end
  }

  -- comments for files
  use {
    "numToStr/Comment.nvim",
    commit = commit.comment,
    event = "BufRead" ,
    config = function()
        require'Comment'.setup()
    end
  }
  -- nvim lsp default configs
  use { 'neovim/nvim-lspconfig', commit = commit.nvim_lspconfig }
  -- advanced rust tooling for nvim
  use { 'simrat39/rust-tools.nvim', requires = 'neovim/nvim-lspconfig' }
  -- js/ts specific language server stuff
 use { 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim' }}
 -- sideload in lsp configurations from other tools
 use { 'jose-elias-alvarez/null-ls.nvim', commit = commit.null_ls }


  -- direnv plugin for local environments
  use { 'direnv/direnv.vim', commit = "ff37d76da391e1ef299d2f5eb84006cb27a67799" }

  -- incredible lisp editing experience in lua
  use { 'Olical/conjure', commit = "2717348d1a0687327f59880914fa260e4ad9c685" }

  -- git interactive in lua
  use { 'TimUntersberger/neogit', commit = "3086635873ae37fc8e28d7de55c2969682104a7d" }
  -- view diffs: not yet working with neogit
  -- use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- show git decorators!
  use { 'lewis6991/gitsigns.nvim', commit = commit.gitsigns, requires = 'nvim-lua/plenary.nvim' }

  -- show code colors in terminal
  use { 'norcalli/nvim-colorizer.lua', commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" }

  use { 'akinsho/toggleterm.nvim', commit = commit.toggleterm, config = function() require'toggleterm'.setup{} end }

  -- status line
  use { 'nvim-lualine/lualine.nvim', commit = commit.lualine }

  -- quick line jump
  use 'ggandor/lightspeed.nvim'

  -- jake color theme
  use 'jakeisnt/theme.nvim'

  -- autoparens
  use { 'windwp/nvim-autopairs', commit = commit.nvim_autopairs }

  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup {update_cwd = true, update_focused_file = { enable = true, update_cwd = true }} end
}

  -- autocomplete
  use { 'ms-jpq/coq_nvim', commit = commit.coq_nvim }
  -- snippets
  use { 'ms-jpq/coq.artifacts', commit = "3eaf9fba507dd01abcd4870221a636f0ecb8cde0" }

  -- file tree (defunct)
  -- use { 'ms-jpq/chadtree', run = 'python3 -m chadtree deps' }

  -- find files, search things, etc
  use { 'nvim-telescope/telescope.nvim', commit = commit.telescope, requires = 'nvim-lua/plenary.nvim' }

  -- display all lsp errors inline
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons', commit = "20469be985143d024c460d95326ebeff9971d714" }

  -- let vim ui select things use the telescope picker
  use { 'nvim-telescope/telescope-ui-select.nvim', commit = "d02a3d3a6b3f6b933c43a28668ae18f78846d3aa" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
