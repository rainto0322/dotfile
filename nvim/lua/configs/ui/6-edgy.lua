return function()
  require("edgy").setup {
    animate = { enabled = false },
    wo = {
      winbar = false,
      winhighlight = "WinBar:Normal,Normal:Normal",
    },
    left = {
      {
        ft = "NvimTree",
        pinned = true,
        collapsed = false,
        size = { height = 0.6, width = 0.15 },
        open = "NvimTreeToggle",
      }
    },
    bottom = {
      { ft = "qf", size = { height = 0.3 } },
      {
        ft = "toggleterm",
        size = { height = 0.3 },
        filter = function(_, win)
          local not_floating = vim.api.nvim_win_get_config(win).relative == ""
          local term = require("toggleterm.terminal").get(1)
          return not_floating and term.direction == "horizontal"
        end,
      },
      {
        ft = "help",
        size = { height = 0.3 },
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      }
    },
  }
end
