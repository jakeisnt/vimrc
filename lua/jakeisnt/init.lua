vim.g.mapleader = " " -- Set leader key before Lazy

-- share keyboard with system
vim.opt.clipboard:append { 'unnamedplus' }

-- Set fold method to manual to prevent automatic folding
vim.opt.foldmethod = 'manual'

-- Set fold level to a large number to ensure all folds are expanded
vim.opt.foldlevel = 99

require("jakeisnt.lazy_init")
require("jakeisnt/aucmds")
require("jakeisnt/options")
require("jakeisnt/keymap")

