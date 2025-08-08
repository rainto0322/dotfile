return function()
  require("autoclose").setup {
    keys = {
      ["<"] = { escape = true, close = true, pair = "<>", enabled_filetypes = { "rust" } },
      [">"] = { escape = true, close = false, pair = "<>" },
    }
  }
end
