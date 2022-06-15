local _2afile_2a = ".config/nvim/fnl/magic/plugin/material.fnl"
local _2amodule_name_2a = "magic.plugin.material"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local nvim = autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
do
  local ok_3f, material = nil, nil
  local function _1_()
    return require("material")
  end
  ok_3f, material = pcall(_1_)
  if ok_3f then
    material.setup({custom_highlights = {FloatBorder = "#1A1A1A"}, borders = true, high_visibility = {darker = true}})
    nvim.g.material_style = "darker"
    nvim.ex.colorscheme("material")
  else
  end
end
return _2amodule_2a