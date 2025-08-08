return function()
  local icon = require("utils.icons")
  require("nvim-tree").setup {
    sort_by = "name",
    view = {
      number = true,
      float = {
        enable = false,
        open_win_config = {
          relative = "editor",
          width = 50,
          height = 30,
        },
      },
      adaptive_size = {
        enable = true,
        max_height = 30,
      },
    },
    renderer = {
      highlight_git = true,
      full_name = false,
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
      indent_markers = {
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          item = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "signcolumn",
        show = {
          file = false,
          folder = false,
          folder_arrow = true,
          git = true,
        },
        padding = " ",
        symlink_arrow = " 󰁔 ",
        glyphs = {
          git = {
            unstaged = icon.git.Mod_alt,
            staged = icon.git.Add,
            unmerged = icon.git.Unmerged,
            renamed = icon.git.Rename,
            untracked = "",
            deleted = icon.git.Remove,
            ignored = icon.git.Ignore,
          },

          folder = {
            arrow_open = '-',
            arrow_closed = '+',
          }
        },
      },
    },
    on_attach = function(bufnr)
      require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
      vim.keymap.del("n", "<C-e>", { buffer = bufnr })
    end,
  }
end
