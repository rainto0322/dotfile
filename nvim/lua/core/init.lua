local settings = require("core.settings")

local set_leader = function()
  vim.g.mapleader = " "
end

local set_icons = function()
  local icon = require("utils.icons")
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icon.diag.Error,
        [vim.diagnostic.severity.WARN] = icon.diag.Warning,
        [vim.diagnostic.severity.INFO] = icon.diag.Information,
        [vim.diagnostic.severity.HINT] = icon.diag.Hint,
      },
    },
  })
end

(function()
  -- set leader key
  set_leader()
  -- set diagostic icons
  set_icons()
  -- set nvim options
  require("core.options")
  -- set auto commands
  require("core.event")
  -- load lazy.nvim & plugins
  require("core.setup")
  -- load keymaps
  require("keymaps")
  -- set colorscheme
  vim.api.nvim_set_option_value("background", settings.background, {})
  vim.cmd.colorscheme(settings.colorscheme)
end)()
