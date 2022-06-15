local _2afile_2a = ".config/nvim/fnl/magic/plugin/which-key.fnl"
local _2amodule_name_2a = "magic.plugin.which-key"
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
do
  local ok_3f, which_key = nil, nil
  local function _1_()
    return require("which-key")
  end
  ok_3f, which_key = pcall(_1_)
  if ok_3f then
    which_key.setup({})
  else
  end
end
return _2amodule_2a