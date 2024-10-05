-- autocommands
vim.api.nvim_create_autocmd('FileType', {
  group = authgroup,
  pattern = 'man',
  command = 'setlocal laststatus=0 noruler'
})

vim.api.nvim_create_autocmd('FileType', {
  group = authgroup,
  pattern = 'NvimTree',
  command = 'setlocal signcolumn=no'
})

-- Add more file types in a single command by separating them with commas
vim.api.nvim_create_autocmd('FileType', {
  group = authgroup,
  pattern = 'vim,lua,css,javascript',
  command = 'setlocal shiftwidth=2'
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = authgroup,
  pattern = 'term://*',
  command = 'setlocal nonumber norelativenumber nocursorline scrolloff=0 signcolumn=no'
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  group = authgroup,
  pattern = '*',
  command = '%s/\\s\\+$//e'
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = authgroup,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { timeout = 150 }
  end,
})

-- Avoid newline continuation of comments
vim.api.nvim_create_autocmd('FileType', {
  group = authgroup,
  pattern = '*',
  command = 'setlocal formatoptions-=cro'
})


-- general keymaps

-- / fix vim defaults /

-- Travel by visible lines when lines wrap, not by all lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Explicitly bind arrow keys to hjkl;
-- allows us to override hjkl defs and fix in both places.
vim.keymap.set('n', '<Left>', 'h')
vim.keymap.set('n', '<Down>', 'j')
vim.keymap.set('n', '<Up>', 'k')
vim.keymap.set('n', '<Right>', 'l')

-- Make 'n' always search forward and 'N' backward
-- http://karolis.koncevicius.lt/posts/porn_zen_and_vimrc/
vim.keymap.set('n', 'n', function() return vim.v.searchforward == 1 and 'n' or 'N' end, { expr = true })
vim.keymap.set('n', 'N', function() return vim.v.searchforward == 1 and 'N' or 'n' end, { expr = true })


-- / vim convenience commands /
vim.keymap.set('n', '<leader>V', 'ggVG') -- Select whole file

-- Use keys to navigate windows
vim.keymap.set('n', '<leader>wh', '<C-W>h')
vim.keymap.set('n', '<leader>wj', '<C-W>j')
vim.keymap.set('n', '<leader>wk', '<C-W>k')
vim.keymap.set('n', '<leader>wl', '<C-W>l')
vim.keymap.set('n', '<leader>ws', ':sp<CR>')
vim.keymap.set('n', '<leader>wv', ':vsp<CR>')
vim.keymap.set('n', '<leader>wc', ':q<cr>')
vim.keymap.set('n', '<space>w=', '<cmd>wincmd =<CR>')

-- Index Vim's default tabs, allowing us to use them
vim.keymap.set('n', '<C-T>', ':tabnew<cr>')
vim.keymap.set('n', '<C-W>', ':tabclose<cr>')
vim.keymap.set('n', '<C-J>', ':tabprev<cr>')
vim.keymap.set('n', '<C-K>', ':tabnext<cr>')
vim.keymap.set('n', '<Tab>', ':bnext<cr>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<cr>', { silent = true })
