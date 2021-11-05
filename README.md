# vimrc
(neo)vim config

Please note that this config was used frequently and has soom good ideas, but hasn't been updated recently; Emacs provides a development environment more conducive to my current interests and work than Vim does, and maintaining two text editors at once has become too much effort for me. 


packages i had (from nix): to be added to some vim plugin system:

            vim-polyglot
            vim-commentary
            nvim-treesitter
            nvim-treesitter-textobjects
            nvim-lspconfig
            completion-nvim
            nvim-compe
            telescope-nvim
            popup-nvim
            plenary-nvim
            nord-nvim
            which-key-nvim
            neogit
            diffview-nvim
            gitsigns-nvim
            auto-pairs
            direnv-vim
            snippets-nvim
            lualine-nvim
            nvim-web-devicons

            nvim-autopairs # trial run
            nvim-colorizer-lua
            lush-nvim
            diagnostic-nvim
            lspsaga-nvim
            rust-tools-nvim

            vim-racket
            conjure

            lightspeed-nvim


and my initial customRC:
          lua require('init')
          colorscheme nord

and some extra plugins:
      editorconfig-core-c
      tree-sitter
      gcc
      # for nvim config file
      sumneko-lua-language-server
      luaformatter

      nodePackages.prettier
      nodePackages.eslint_d
      nodePackages.diagnostic-languageserver

lots of progress was made switching to fennel. pick that stuff up here: https://github.com/jakeisnt/nix-cfg/pull/170
