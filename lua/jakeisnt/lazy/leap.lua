return {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
  },
  config = function()
    -- defines 's', 'S', and 'gS'
    require("leap").create_default_mappings()
  end,
}
