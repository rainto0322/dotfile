return function()
  local icon = require("utils.icons")
  require("which-key").setup {
    preset = "helix",
    delay = 0,
    win = {
      border = "single",
    },
    expand = 1,
    icons = {
      group = "",
      rules = false,
      colors = false,
      breadcrumb = icon.ui.Separator,
      separator = "│",
      keys = {
        C = "Ctrl-",
        M = "Alt-",
        S = "Shift-",
        BS = "BS",
        CR = "CR",
        NL = "NL",
        Esc = "Esc",
        Tab = "Tab",
        Up = "Up",
        Down = "Down",
        Left = "Left",
        Right = "Right",
        Space = "Space",
        ScrollWheelUp = "ScrollWheelUp",
        ScrollWheelDown = "ScrollWheelDown",
      },
    },
    spec = {
      { "<leader>p", group = icon.ui.Package .. " Lazy Package" },
    },
  }
end
