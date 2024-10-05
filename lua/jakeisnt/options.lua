local o = vim.opt

-- Appearance
o.cursorline = true
o.foldenable = false
o.ruler = false -- Statusline takes care of that
o.showmode = false
o.showmatch = true
o.signcolumn = "yes"
o.wrap = true
o.sidescrolloff = 8

-- Backups
o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = true

-- Completion
o.completeopt = { "menuone", "noselect" }
o.pumheight = 6
o.pumblend = 10

-- General
o.clipboard = "unnamedplus"
o.hidden = true
o.joinspaces = false
o.mouse = "a"
o.scrolloff = 4
o.splitbelow = true
o.splitright = true
o.timeoutlen = 1000
o.updatetime = 100
o.virtualedit = "block"
o.iskeyword:append("-")
o.smartindent = true

-- Performance
o.lazyredraw = true

-- Search
o.inccommand = "nosplit" -- Show substitutions incrementally
o.ignorecase = true
o.smartcase = true
o.wildignore = { ".git", "**/node_modules/**" }
o.wildignorecase = true

-- Tabs
o.expandtab = true
o.shiftwidth = 4

-- Shortmess
o.shortmess:append({ A = true, c = true, I = true, W = true })

-- Highlighting
vim.cmd("highlight Comment gui=italic")

-- Format options
o.formatoptions = o.formatoptions
  + "j" -- Auto-remove comments when combining lines ( <C-J> )
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "q" -- Allow formatting comments w/ gq
  - "c" -- In general, I like it when comments respect textwidth
  - "r" -- But do continue when pressing enter.
  - "o" -- O and o, don't continue comments
  - "t" -- Don't auto format my code. I have linters for that.
