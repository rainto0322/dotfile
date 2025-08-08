return function()
  local icon = require("utils.icons")
  require("bufferline").setup {
    options = {
      numbers = "ordinal", "",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      modified_icon = icon.ui.Tag,
      buffer_close_icon = icon.ui.Close,
      left_trunc_marker = icon.ui.Left,
      right_trunc_marker = icon.ui.Right,
      indicator = {
        icon = '│',
        style = 'icon',
      },
      color_icons = true,
      separator_style = "thin",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count)
        return "(" .. count .. ")"
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          padding = 0,
        },
        {
          filetype = "trouble",
          text = "LSP Outline",
          text_align = "center",
          padding = 0,
        },
      },
    },
  }
end