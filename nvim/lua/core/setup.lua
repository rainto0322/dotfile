local fn = vim.fn
local env = require("core.env")
local use_ssh = require("core.settings").use_ssh
local lazy_config = require("core.lazy-config")


function LoadLazy()
  vim.opt.rtp:prepend(env.lazy_path)
  require("lazy").setup(env.modules, lazy_config)
end

function SetupLazy()
  local git_url = use_ssh and "git@github.com:folke/lazy.nvim.git" or "https://github.com/folke/lazy.nvim.git"
  local cmd = { "git", "clone", "--progress", "--filter=blob:none", git_url, "--branch=stable", env.lazy_path }

  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stderr = function(_, data)
      for _, line in ipairs(data) do
        if line ~= "" then
          print(line)
        end
      end
    end,
    on_exit = function(_, code)
      LoadLazy()
    end
  })
end

(function()
  if fn.empty(fn.glob(env.lazy_path)) > 0 then SetupLazy() else LoadLazy() end
end)()
