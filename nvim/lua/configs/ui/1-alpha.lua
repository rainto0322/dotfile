return function()
  local dashboard = require("alpha.themes.dashboard")



  local function Button(kbind, txt, callback)
    return {
      type = "button",
      val = txt,
      on_press = callback,
      opts = {
        shortcut = kbind,
        position = "center",
        cursor = -2,
        width = 50,
        align_shortcut = "right",
        hl = "AlphaButtons",
        hl_shortcut = "AlphaShortcut",
      }
    }
  end

  -- Homepage Logo
  dashboard.section.header.val = require("core.settings").dashboard_logo
  dashboard.section.header.opts.hl = "AlphaHeader"

  -- Homepage Menu List
  dashboard.section.buttons.val = {
    Button("<leader>dd", "󱃪 Retrieve dossiers", function()
      require("search").open({ collection = "dossier" })
    end),
    Button("<leader>p", "󰱼 Find a Document", function()
      require("search").open({ collection = "file" })
    end),
    Button("<leader>g", " Locate git objects", function()
      require("search").open({ collection = "git" })
    end),
    Button("<leader>c", "󰔎 Change Colorscheme", function()
      require("search").open({ collection = "misc" })
    end),
  }

  -- Homepage Footer
  dashboard.section.footer.val = function()
    local stats = require("lazy").stats()
    return "   Have Fun with neovim"
        .. " 󰀨 v"
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
        .. "  󰂖 "
        .. stats.count
        .. " plugins "
  end
  dashboard.section.footer.opts.hl = "AlphaFooter"

  dashboard.config.layout = {
    { type = "padding", val = 10 },
    dashboard.section.header,
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    { type = "padding", val = 2 },
    dashboard.section.footer,
  }

  require("alpha").setup(dashboard.config)
end
