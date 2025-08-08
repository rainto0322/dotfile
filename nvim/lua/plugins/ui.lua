local ui = {}

-- Homepage dashboard
ui["goolord/alpha-nvim"] = {
  lazy = true,
  event = "BufWinEnter",
  config = require("ui.1-alpha"),
}

-- notification manager
ui["rcarriga/nvim-notify"] = {
  lazy = true,
  event = "VeryLazy",
  config = require("ui.2-notify"),
}

-- Bottom bar
ui["nvim-lualine/lualine.nvim"] = {
  lazy = true,
  event = { "VimEnter", "BufReadPost", "BufAdd", "BufNewFile" },
  config = require("ui.3-lualine")
}

-- Top bar, A snazzy buffer line
ui["akinsho/bufferline.nvim"] = {
  lazy = true,
  event = { "BufReadPre", "BufAdd", "BufNewFile" },
  config = require("ui.4-bufferline"),
}

-- A polished winbar
ui["Bekaboo/dropbar.nvim"] = {
  lazy = false,
  event = { "BufReadPre", "CursorMoved", "WinEnter", "WinResized" },
  config = require("ui.5-dropbar"),
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    'nvim-telescope/telescope-fzf-native.nvim',
  }
}

-- manage predefined window layouts
ui["folke/edgy.nvim"] = {
  lazy = true,
  event = { "VeryLazy" },
  config = require("ui.6-edgy"),
}

-- A File Explorer
ui["nvim-tree/nvim-tree.lua"] = {
  lazy = true,
  cmd = {
    "NvimTreeToggle",
    "NvimTreeOpen",
    "NvimTreeFindFile",
    "NvimTreeFindFileToggle",
    "NvimTreeRefresh",
  },
  config = require("ui.7-nvim-tree"),
}

-- toggle multiple terminals
ui["akinsho/toggleterm.nvim"] = {
  lazy = true,
  cmd = {
    "ToggleTerm",
    "ToggleTermSetName",
    "ToggleTermToggleAll",
    "ToggleTermSendVisualLines",
    "ToggleTermSendCurrentLine",
    "ToggleTermSendVisualSelection",
  },
  config = require("ui.8-toggleterm"),
}

-- Command line prompt 
ui["gelguy/wilder.nvim"] = {
	lazy = true,
	event = "CmdlineEnter",
	config = require("ui.9-wilder"),
	dependencies = { "romgrk/fzy-lua-native" },
}

----------------------------------------------------------------------
--                        Highlight Config                          --
----------------------------------------------------------------------

-- adds indentation guides to Neovim
ui["lukas-reineke/indent-blankline.nvim"] = {
  lazy = true,
  event = { "CursorHold", "CursorHoldI" },
  config = require("ui.hlgh.indent-blankline"),
}

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
ui["nvim-telescope/telescope.nvim"] = {
  lazy = true,
  cmd = "Telescope",
  config = require("ui.telescope"),
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "jvgrootveld/telescope-zoxide" },
    { "debugloop/telescope-undo.nvim" },
    { "nvim-telescope/telescope-frecency.nvim" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
      "ibhagwan/fzf-lua",
      lazy = true,
      event = "VeryLazy",
      config = require("ui.telescope.fzf-lua"),
    },
    {
      "ayamir/search.nvim",
      config = require("ui.telescope.search"),
    },
    {
      "ayamir/project.nvim",
      event = { "CursorHold", "CursorHoldI" },
      config = require("ui.telescope.project"),
    },
    {
      "aaronhallaert/advanced-git-search.nvim",
      cmd = { "AdvancedGitSearch" },
      dependencies = {
        "tpope/vim-rhubarb",
        "tpope/vim-fugitive",
        "sindrets/diffview.nvim",
      },
    },
  },
}

-- color schemes
ui["rose-pine/neovim"] = {
  lazy = false,
  name = "rose-pine",
  priority = 1000,
  config = require("ui.hlgh.rose-pine")
}

return ui
