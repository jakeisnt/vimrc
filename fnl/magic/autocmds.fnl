(module magic.autocmds
  {autoload {nvim aniseed.nvim}
   require-macros [magic.macros]})

(augroup ftplugin
         (nvim.ex.autocmd
           :FileType "man"
           (.. "setl laststatus=0 noruler"))
         (nvim.ex.autocmd
           :FileType "NvimTree" 
           (.. "setl scl=no"))
         (nvim.ex.autocmd 
           :TermOpen "term://*" 
           (.. "setl nornu nonu nocul so=0 scl=no")))

(augroup onsave
         ;; remove whitespaces on save
         (nvim.ex.autocmd
           :BufWritePre "*" (.. "%s/\\s\\+$//e")))

(augroup general
         (nvim.ex.autocmd 
           :TextYankPost "*" "silent! lua vim.highlight.on_yank { timeout = 150 }")
         ;; avoid newline continuation of comments
         (nvim.ex.autocmd
           :FileType "*" "set fo-=cro"))
