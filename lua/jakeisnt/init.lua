-- Check for internet connection
local function check_internet_connection()
    local handle = io.popen("ping -c 1 8.8.8.8")
    if handle then
        local result = handle:read("*a")
        handle:close()
        return result:match("1 packets transmitted, 1 packets received") ~= nil
    end
    return false
end

-- Check for upstream changes and pull if any
local function check_and_pull_upstream()
    local handle = io.popen("git -C " .. vim.fn.stdpath("config") .. " fetch")
    if handle then
        handle:close()
    end

    handle = io.popen("git -C " .. vim.fn.stdpath("config") .. " status -uno")
    if handle then
        local result = handle:read("*a")
        handle:close()
        if result:match("Your branch is behind") then
            vim.fn.system("git -C " .. vim.fn.stdpath("config") .. " pull")
            print("Neovim config updated from upstream.")
        end
    end
end

-- Run the check_and_pull_upstream function if internet is available
if check_internet_connection() then
    check_and_pull_upstream()
else
    print("No internet connection. Skipping config update check.")
end

vim.g.mapleader = " " -- Set leader key before Lazy

-- share keyboard with system
vim.opt.clipboard:append({ "unnamedplus" })

-- Set fold method to manual to prevent automatic folding
vim.opt.foldmethod = "manual"

-- Set fold level to a large number to ensure all folds are expanded
vim.opt.foldlevel = 99

require("jakeisnt.lazy_init")
require("jakeisnt/aucmds")
require("jakeisnt/options")
require("jakeisnt/keymap")
