return function()

  require("ibl").setup {
    enabled = true,
    debounce = 200,
    indent = {
      char = "▏",
      tab_char = "▏",
      smart_indent_cap = true,
      priority = 2,
    },
    scope = {
      char = "▏",
      -- char = "▌",
      show_start = false,
      show_end = false,
      injected_languages = true,
      priority = 1000,
    }
  }
end
