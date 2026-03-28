local M = {}

-- Look through dotfiles to find configurations
function M.find_dotfiles()
  require("telescope.builtin").find_files({
    prompt_title = " dotfiles ",
    find_command = { "rg", "--files", "--hidden", "--sort=path" },
    cwd = "/etc/nixos",
  })
end

-- look through current project files to find configurations
M.project_files = function()
  local ok = pcall(require("telescope.builtin").git_files)
  if not ok then
    require("telescope.builtin").find_files()
  end
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
      },
    })
    require("telescope").load_extension("ui-select")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", M.project_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
    vim.keymap.set("n", "<leader>fl", builtin.live_grep, {})
    vim.keymap.set("n", ";", builtin.buffers, {})
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    -- nmap("<space>fb", "<cmd>Telescope buffers<CR>")
    -- nmap("<space>pp", "<cmd>Telescope projects<CR>")
    -- nmap("<space>,", "<cmd>Telescope buffers<CR>")
    -- nmap("<space>fh", "<cmd>Telescope help_tags<CR>")
    -- nmap("<space>fo", "<cmd>Telescope oldfiles<CR>")
    -- nmap("<space>fd", '<cmd>lua require("plugin.telescope").find_dotfiles()<CR>')
    -- nmap("<space>fk", ":Telescope file_browser hidden=true<cr>")
  end,
}
