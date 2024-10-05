local nmap = U.keymap.nmap
local imap = U.keymap.imap
local tmap = U.keymap.tmap
local cmap = U.keymap.cmap
local xmap = U.keymap.xmap

nmap("<leader>", "<Nop>")
xmap("<leader>", "<Nop>")

nmap("<leader>ot", "<cmd>ToggleTerm<CR>")
nmap("<leader>.", "<cmd>NvimTreeToggle<cr>")

-- Normal
nmap("Q", "<Nop>")
nmap("q:", "<Nop>")
nmap("<C-c>", "<Esc>")
nmap("Y", "y$")
nmap("<A-j>", ":m .+1<cr>==") -- move cur line down
nmap("<A-k>", ":m .-2<cr>==") -- move cur line up
nmap("<leader>q", ":q<cr>")
nmap("<leader>kb", ":bw<cr>")

-- avoid pressing shift
nmap("<leader><leader>", ":e#<CR>")
-- select last insertion
nmap("gV", "`[v`]")
-- cancel search with esc
nmap("<silent> <Esc>", ":nohlsearch<Bar>:echo<CR>")

nmap("yil", "0y$")
nmap("<CR>", '{-> v:hlsearch ? ":nohl\\<CR>" : "\\<CR>"}()', { expr = true })

-- compress next multiline passage into a single line?
-- i don't entirely understand what this does
nmap("Q", "gqap")
nmap("<C-s>", "<cmd>w<CR>")

-- Buffers
nmap("<Tab>", "<cmd>bn<CR>")
nmap("<S-Tab>", "<cmd>bp<CR>")
nmap("<space>bd", "<cmd>bd<CR>")

-- Insert
imap("<C-c>", "<Esc>")
imap("<S-CR>", "<Esc>o")
imap("<C-CR>", "<Esc>O")
imap("<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
imap("<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })
-- imap('<CR>', 'v:lua.U.completion_confirm()', {expr = true})

-- Visual
xmap("<", "<gv")
xmap(">", ">gv")
xmap("K", ":move '<-2<CR>gv-gv")
xmap("J", ":move '>+1<CR>gv-gv")

-- backspace deletes selected text
xmap("<BS>", "x")
xmap("Q", "gq")
xmap("<silent> *", ":<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>")
xmap("<silent> #", ":<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>")

-- Command
cmap("<C-a>", "<Home>")
cmap("<C-e>", "<End>")
cmap("<C-h>", "<Left>")
cmap("<C-j>", "<Down>")
cmap("<C-k>", "<Up>")
cmap("<C-l>", "<Right>")
cmap("<C-d>", "<Del>")
cmap("<C-f>", '<C-R>=expand("%:p")<CR>')

-- Git
nmap("<leader>gl", ":Neogit log<cr>")
nmap("<leader>gp", ":Neogit push<cr>")
nmap("<leader>gb", ":Neogit push<cr>")
nmap("<space>gc", ":Neogit commit<cr>")
nmap("<leader>gd", ":DiffviewOpen<cr>")
nmap("<leader>gD", ":DiffviewOpen main<cr>")
