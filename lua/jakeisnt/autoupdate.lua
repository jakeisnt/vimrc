-- Check for internet connection asynchronously
local function check_internet_connection(callback)
  vim.loop.spawn("ping", {
    args = { "-c", "1", "8.8.8.8" },
    stdio = { nil, vim.loop.new_pipe(false), vim.loop.new_pipe(false) },
  }, function(code)
    callback(code == 0)
  end)
end

-- Check for upstream changes and pull if any asynchronously
local function check_and_pull_upstream(callback)
  local config_path = vim.fn.stdpath("config")
  vim.loop.spawn("git", {
    args = { "-C", config_path, "fetch" },
    stdio = { nil, vim.loop.new_pipe(false), vim.loop.new_pipe(false) },
  }, function()
    vim.loop.spawn("git", {
      args = { "-C", config_path, "status", "-uno" },
      stdio = { nil, vim.loop.new_pipe(false), vim.loop.new_pipe(false) },
    }, function(code, _, stdout)
      if stdout and stdout:match("Your branch is behind") then
        vim.loop.spawn("git", {
          args = { "-C", config_path, "pull" },
          stdio = { nil, vim.loop.new_pipe(false), vim.loop.new_pipe(false) },
        }, function(_, _, stdout)
          vim.schedule(function()
            local commit_messages = {}
            if stdout then
              for line in stdout:gmatch("[^\r\n]+") do
                local message = line:match("^%s*(.-)%s*$")
                if message and message ~= "" then
                  table.insert(commit_messages, message)
                end
              end
            end
            callback(commit_messages)
          end)
        end)
      else
        callback(nil)
      end
    end)
  end)
end

-- Run the check_and_pull_upstream function if internet is available
check_internet_connection(function(has_internet)
  if has_internet then
    check_and_pull_upstream(function(commit_messages)
      -- print("Commit messages: " .. vim.inspect(commit_messages))
      if true then
        vim.schedule(function()
          vim.ui.input({
            prompt = "Neovim config update available. Reload config to apply? (y/n): ",
          }, function(input)
            if input and input:lower() == "y" then
              vim.schedule(function()
                print("Reloading config...")
                vim.cmd("silent! source " .. vim.fn.stdpath("config") .. "/init.lua")
              end)
            end
          end)
        end)
      end
    end)
  else
    vim.schedule(function()
      print("No internet connection. Skipping config update check.")
    end)
  end
end)
