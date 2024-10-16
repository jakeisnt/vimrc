-- general keymaps

-- / fix vim defaults /

-- Travel by visible lines when lines wrap, not by all lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Explicitly bind arrow keys to hjkl;
-- allows us to override hjkl defs and fix in both places.
vim.keymap.set("n", "<Left>", "h")
vim.keymap.set("n", "<Down>", "j")
vim.keymap.set("n", "<Up>", "k")
vim.keymap.set("n", "<Right>", "l")

-- Make 'n' always search forward and 'N' backward
-- http://karolis.koncevicius.lt/posts/porn_zen_and_vimrc/
vim.keymap.set("n", "n", function()
  return vim.v.searchforward == 1 and "n" or "N"
end, { expr = true })
vim.keymap.set("n", "N", function()
  return vim.v.searchforward == 1 and "N" or "n"
end, { expr = true })

-- 'Y' should also copy the key under the cursor
vim.keymap.set("n", "Y", "y$")

-- / vim convenience commands /

-- Move the current line up and down by holding alt
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==")
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==")

-- Use keys to navigate windows
vim.keymap.set("n", "<leader>wh", "<C-W>h")
vim.keymap.set("n", "<leader>wj", "<C-W>j")
vim.keymap.set("n", "<leader>wk", "<C-W>k")
vim.keymap.set("n", "<leader>wl", "<C-W>l")
vim.keymap.set("n", "<leader>ws", ":sp<CR>")
vim.keymap.set("n", "<leader>wv", ":vsp<CR>")
vim.keymap.set("n", "<leader>wc", ":q<cr>")
vim.keymap.set("n", "<space>w=", "<cmd>wincmd =<CR>")

-- Index Vim's default tabs, allowing us to use them
vim.keymap.set("n", "<C-T>", ":tabnew<cr>")
vim.keymap.set("n", "<C-W>", ":tabclose<cr>")
vim.keymap.set("n", "<C-J>", ":tabprev<cr>")
vim.keymap.set("n", "<C-K>", ":tabnext<cr>")
vim.keymap.set("n", "<Tab>", ":bnext<cr>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<cr>", { silent = true })
