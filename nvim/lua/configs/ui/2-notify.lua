return function()
  local icon = require("utils.icons")
  require('notify').setup {
    ---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
    stages = "fade",
    on_open = function(win)
      vim.api.nvim_set_option_value("winblend", 0, { scope = "local", win = win })
      vim.api.nvim_win_set_config(win, { zindex = 90 })
    end,
    on_close = nil,
    timeout = 2000,
    fps = 20,
    render = "default",
    background_colour = "NotifyBackground",
    minimum_width = 50,
    level = "INFO",
    icons = {
      ERROR = icon.diag.Error,
      WARN = icon.diag.Warning,
      INFO = icon.diag.Information,
      DEBUG = icon.ui.Bug,
      TRACE = icon.ui.Pen,
    },
  }
  vim.notify = require('notify')
end
