-- autocommands
local authgroup = vim.api.nvim_create_augroup("AuthGroup", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = authgroup,
  pattern = "man",
  command = "setlocal laststatus=0 noruler",
})

vim.api.nvim_create_autocmd("FileType", {
  group = authgroup,
  pattern = "NvimTree",
  command = "setlocal signcolumn=no",
})

-- Add more file types in a single command by separating them with commas
vim.api.nvim_create_autocmd("FileType", {
  group = authgroup,
  pattern = "vim,lua,css,javascript",
  command = "setlocal shiftwidth=2",
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = authgroup,
  pattern = "term://*",
  command = "setlocal nonumber norelativenumber nocursorline scrolloff=0 signcolumn=no",
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = authgroup,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = authgroup,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

-- Avoid newline continuation of comments
vim.api.nvim_create_autocmd("FileType", {
  group = authgroup,
  pattern = "*",
  command = "setlocal formatoptions-=cro",
})


vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = authgroup,
  pattern = "*",
  callback = function()
    local buftype = vim.bo.buftype
    local file_path = vim.fn.expand("%:p")

    if buftype == "" and file_path ~= "" then
      local shell = vim.env.SHELL

      local relative_path = vim.fn.fnamemodify(file_path, ":~")

      local bash_history_path = vim.fn.expand("~/.bash_history")
      local zsh_history_path = vim.fn.expand("~/.zsh_history")
      local nushell_history_path = vim.fn.expand("~/.config/nushell/history.txt")

      local command = ""

      if shell and (shell:find("nu") or shell:find("nushell")) then
        -- Use nushell command
        command = string.format("'vi %s\n' | save --append %s", relative_path, nushell_history_path)
      elseif shell and shell:find("zsh") then
        -- Use zsh command
        command = string.format("echo 'vi %s' >> %s", relative_path, zsh_history_path)
      else
        -- Default to bash command
        command = string.format("echo 'vi %s' >> %s", relative_path, bash_history_path)
      end

      vim.fn.system(command)
    end
  end
})
