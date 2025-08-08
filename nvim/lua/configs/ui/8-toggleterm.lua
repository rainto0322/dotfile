return function()
  require("toggleterm").setup {
    direction = "horizontal",
    on_open = function(term)
      vim.api.nvim_win_set_option(term.window, "winbar", "")
      vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
      vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })
    end,
    highlights = {
      Normal = {
        link = "Normal",
      },
      NormalFloat = {
        link = "NormalFloat",
      },
      FloatBorder = {
        link = "FloatBorder",
      },
    },
    open_mapping = false,
  }
end
