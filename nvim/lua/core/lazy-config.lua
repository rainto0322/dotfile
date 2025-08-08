local env = require("core.env")
local settings = require("core.settings")
local icon = require("utils.icons")
return {
  root = env.data_dir .. "/lazy",
  git = {
    timeout = 300,
    url_format = settings.use_ssh and "git@github.com:%s.git" or "https://github.com/%s.git",
  },
  install = {
    missing = true,
    colorscheme = { settings.colorscheme },
  },
  ui = {
    wrap = true,
    size = { width = 0.45, height = 0.6 },
    border = "single",
  },
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath("cache") .. "/lazy/cache",
      disable_events = { "UIEnter", "BufReadPre" },
      ttl = 3600 * 24 * 2,
      reset_packpath = true,
    },
    rtp = {
      reset = true,
      paths = {},
      disabled_plugins = {},
    },
  },
}
