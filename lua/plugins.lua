local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'

  use 'direnv/direnv.vim'
  use 'Olical/conjure'

  use 'TimUntersberger/neogit'
  use 'nvim-lualine/lualine.nvim'

  use 'ggandor/lightspeed.nvim'

  use 'shaunsingh/nord.nvim'

  use 'windwp/nvim-autopairs'

  use 'hrsh7th/nvim-cmp'

  use { 'nvim-telescope/telescope.nvim', requires = {{ 'nvim-lua/plenary.nvim' }}}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
