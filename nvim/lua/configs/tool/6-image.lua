return function()
  require("image").setup {
    backend = "kitty",
    processor = "magick_cli",
    integrations = {
      html = { enabled = false },
    },
    rocks = {
      hererocks = true,
      enabled = true,
    },
    render = {
      max_width = 1000,
      max_height = 1000,
      quality = 90,
      background = "transparent",
    },
    mappings = {
      zoom_in = "<C-=>",
      zoom_out = "<C-->",
      reset_zoom = "<C-0>",
      next_image = "<C-l>",
      prev_image = "<C-h>",
    },
    filetype_exclude = { "markdown", "text", "help" },
  }
end
