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


