(module magic.init
  {autoload {plugin magic.plugin
             nvim aniseed.nvim}})

;;; Introduction

;; Aniseed compiles this (and all other Fennel files under fnl) into the lua
;; directory. The init.lua file is configured to load this file when ready.

;; We'll use modules, macros and functions to define our configuration and
;; required plugins. We can use Aniseed to evaluate code as we edit it or just
;; restart Neovim.

;; You can learn all about Conjure and how to evaluate things by executing
;; :ConjureSchool in your Neovim. This will launch an interactive tutorial.


;;; Generic configuration

(set nvim.o.cmdheight 1)
(set nvim.o.curssorline true)
(set nvim.o.foldenable true)
(set nvim.o.ruler false) ;; status line should measure this
(set nvim.o.showmode false)
(set nvim.o.showmatch true)
(set nvim.o.signcolumn "yes")
(set nvim.o.termguicolors true)
(set nvim.o.wrap true)
(set nvim.o.sidescrolloff 8)

;; backups
(set nvim.o.backup false)
(set nvim.o.writebackup false)
(set nvim.o.swapfile false)
(set nvim.o.undofile true)

;; completion
(set nvim.o.completeopt "menuone,noselect")
(set nvim.o.pumheight 6)
(set nvim.o.pumblend 10)

;; other general
(set nvim.o.clipboard "unnamedplus") ;; share system clipboard
(set nvim.o.hidden true)
(set nvim.o.joinspaces false)
(set nvim.o.mouse "a")
(set nvim.o.scrolloff 4)
(set nvim.o.splitbelow true)
(set nvim.o.splitright true)
(set nvim.o.timeoutlen 1000)
(set nvim.o.updatetime 100)
(set nvim.o.virtualedit "block")
(set nvim.o.iskeyword (.. nvim.o.iskeyword "-"))
(set nvim.o.smartindent true)

;; performance
(set nvim.o.lazyredraw true)

;; search
(set nvim.o.inccommand "nosplit") ;; show substitutions incrementally
(set nvim.o.ignorecase true)
(set nvim.o.smartcase true)
(set nvim.o.wildignore ".git,**/node_modules/**")
(set nvim.o.wildicnorecase true)

;; tabs
(set nvim.o.expandtab true)
(set nvim.o.shiftwidth 4)

;; shortmess
(set nvim.o.shortmess (.. nvim.o.shortmess "A" "c" "I" "W"))

;; show comments in italic
;; cmd("highlight Comment gui=italic")

(set nvim.o.formatoptions 
     (.. o.formatoptions
        "j" ; autoremove comments when combining lines
        "n" ; indent past format list pattern
        "q" ; allow formatting comments with `gq`
        "c" ; comments respect textwidth settings
        "r" ; continue when pressing enter
        "o" ; don't continue comments
        "t")); don't autoformat code with nvim; other linters do this

;; (set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")

(nvim.ex.set :spell)
(nvim.ex.set :list)


;;; Mappings

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")


;;; Plugins

;; Run script/sync.sh to update, install and clean your plugins.
;; Packer configuration format: https://github.com/wbthomason/packer.nvim
(plugin.use
  :Olical/aniseed {}
  :Olical/conjure {}
  :Olical/nvim-local-fennel {}
  :PeterRincker/vim-argumentative {}
  :airblade/vim-gitgutter {}
  :clojure-vim/clojure.vim {}
  :clojure-vim/vim-jack-in {}
  :folke/which-key.nvim {:mod :which-key}
  :ggandor/lightspeed.nvim {}
  :guns/vim-sexp {:mod :sexp}
  :hrsh7th/nvim-compe {:mod :compe}
  :jiangmiao/auto-pairs {:mod :auto-pairs}
  :lewis6991/impatient.nvim {}
  :liuchengxu/vim-better-default {:mod :better-default}
  :marko-cerovac/material.nvim {:mod :material}
  :mbbill/undotree {:mod :undotree}
  :neovim/nvim-lspconfig {:mod :lspconfig}
  :nvim-lualine/lualine.nvim {:mod :lualine}
  :nvim-telescope/telescope.nvim {:mod :telescope :requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}
  :radenling/vim-dispatch-neovim {}
  :tami5/compe-conjure {}
  :tpope/vim-abolish {}
  :tpope/vim-commentary {}
  :tpope/vim-dispatch {}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :tpope/vim-vinegar {}
  :w0rp/ale {:mod :ale}
  :wbthomason/packer.nvim {}

  :jakeisnt/stilla.nvim {}
  :wakatime/vim-wakatime {}
  :direnv/direnv.vim {}
  
  :simrat39/rust-tools.nvim {:requires [[neovim/nvim-lspconfig]]}

  :nvim-orgmode/orgmode {:config (fn [] (.setup (require "orgmode")))}
  :ahmedkhalf/project.nvim {:config (fn [] (.setup (require "project.nvim") {}))}
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"}
)
