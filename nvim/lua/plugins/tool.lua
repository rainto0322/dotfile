local tool = {}

-- Keymap prompt
tool["folke/which-key.nvim"] = {
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  config = require("tool.1-which-key"),
}

-- The copy-pasta rabbit hole
tool["ibhagwan/smartyank.nvim"] = {
  lazy = true,
  event = "BufReadPost",
  config = require("tool.2-smartyank"),
}

-- working with sessions
tool["olimorris/persisted.nvim"] = {
  lazy = true,
  cmd = {
    "SessionToggle",
    "SessionStart",
    "SessionStop",
    "SessionSave",
    "SessionLoad",
    "SessionLoadLast",
    "SessionLoadFromFile",
    "SessionDelete",
  },
  config = require("tool.3-persisted"),
}

-- Jump anywhere in a document
tool["smoka7/hop.nvim"] = {
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  config = require("tool.4-hop"),
}

-- Jump marks
tool["chentoast/marks.nvim"] = {
  lazy = true,
  event = "VeryLazy",
  config = require("tool.marks")
}


-- Code folding
tool["kevinhwang91/nvim-ufo"] = {
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = 'kevinhwang91/promise-async',
  config = require("tool.5-ufo"),
}

-- Image viewer
-- tool["3rd/image.nvim"] = {
--  lazy = true,
--  event = "BufReadPost",
--   config = require("tool.6-image"),
-- }

return tool
