local bind = require("utils.bind")
local map, cmd, callback = bind.map, bind.cmd, bind.callback
local help = require("keymaps.helpers")

local Plugins = {
  --  hop.nvim
  ["nvi|ff"] = cmd("HopWordMW"):noremap():silent():nowait():desc("Jump: Goto one char"),
  ["nvi|fl"] = cmd("HopLineMW"):noremap():silent():nowait():desc("Jump: Goto one line"),
  ["nvi|FF"] = cmd("HopChar2MW"):noremap():silent():nowait():desc("Jump: Goto two char"),
  --  ufo.nvim
  ["nvi|zz"] = cmd("normal za"):noremap():silent():desc("Fold: Peek folded lines"),
  ["nvi|zj"] = map("zj"):noremap():silent():desc("Fold: Goto next fold"),
  ["nvi|zk"] = map("zk"):noremap():silent():desc("Fold: Goto previous fold"),
  ["nvi|<leader>zr"] = cmd("UfoRefold"):noremap():silent():desc("Fold: Refold all"),
  ["nvi|<leader>zR"] = cmd("UfoUnfoldAll"):noremap():silent():desc("Fold: Unfold all"),
  -- nvim-tree / toggleterm
  ["nvti|<leader>e"] = cmd("NvimTreeToggle"):noremap():silent():desc("Window: Toggle Explorer"),
  ["nvti|<leader>m"] = cmd("ToggleTerm"):noremap():silent():desc("Window: Toggle command panel"),
  -- telescope
  ["nvi|<leader>p"] = callback(function()
    require("search").open({ collection = "file" })
  end):noremap():silent():desc("Search: Find file"),
  ["nvi|<leader>dd"] = callback(function()
    require("search").open({ collection = "dossier" })
  end):noremap():silent():desc("Search: Retrieve dossiers"),
  ["nvi|<leader>f"] = callback(function()
    require("search").open({ collection = "pattern" })
  end):noremap():silent():desc("Search: Search current word"),
  ["nvi|<leader>g"] = callback(function()
    require("search").open({ collection = "git" })
  end):noremap():silent():desc("Search: Locate git objects"),
  ["nvi|<leader>c"] = callback(function()
    require("search").open({ collection = "misc" })
  end):noremap():silent():desc("Search: Miscellaneous artifacts"),


}

bind.load_mapping(Plugins)
