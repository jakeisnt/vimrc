local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- better highlighting and code interaction
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- navigate code with respect to textobjects!
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- refactoring utils for treesitter
  use 'nvim-treesitter/nvim-treesitter-refactor'
  -- change comment string based on what's under cursor
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- auto close and auto rename html tags
 use 'windwp/nvim-ts-autotag'

  -- comments for files
  use { 'terrortylor/nvim-comment' }

  -- nvim lsp default configs
  use 'neovim/nvim-lspconfig'
  -- advanced rust tooling for nvim
  use { 'simrat39/rust-tools.nvim', requires = 'neovim/nvim-lspconfig' }
  -- js/ts specific language server stuff
 use { 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim' }}
 -- sideload in lsp configurations from other tools
 use  'jose-elias-alvarez/null-ls.nvim'

  -- direnv plugin for local environments
  use 'direnv/direnv.vim'

  -- incredible lisp editing experience in lua
  use 'Olical/conjure'

  -- git interactive in lua
  use 'TimUntersberger/neogit'
  -- view diffs
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- show git decorators!
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- show code colors in terminal
  use 'norcalli/nvim-colorizer.lua'

  -- status line
  use 'nvim-lualine/lualine.nvim'

  -- quick line jump
  use 'ggandor/lightspeed.nvim'

  -- nord color theme
  use 'shaunsingh/nord.nvim'

  -- autoparens
  use 'windwp/nvim-autopairs'

  -- autocomplete
  use 'ms-jpq/coq_nvim'
  -- snippets
  use 'ms-jpq/coq.artifacts'

  -- file tree
  use { 'ms-jpq/chadtree', run = 'python3 -m chadtree deps' }

  -- find files, search things, etc
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- display all lsp errors inline
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }

  -- let vim ui select things use the telescope picker
  use 'nvim-telescope/telescope-ui-select.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
