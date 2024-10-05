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
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6', -- or, branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
  },
  config = function()
    -- require("telescope").load_extension("projects")
    require("telescope").load_extension("ui-select")
    require('telescope').setup({})

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', M.project_files, {})
    -- vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
    -- vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
    -- vim.keymap.set('n', ';', builtin.buffers, {})
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end
}
