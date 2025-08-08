local bind = require("utils.bind")
local cmd = bind.cmd

local Package = {
  -- lazy.nvim plugins manager
  ["n|<leader>ph"] = cmd("Lazy"):noremap():silent():desc("Package: Show"),
  ["n|<leader>pi"] = cmd("Lazy install"):noremap():silent():desc("Package: Install"),
  ["n|<leader>pu"] = cmd("Lazy update"):noremap():silent():desc("Package: Update"),
  ["n|<leader>ps"] = cmd("Lazy sync"):noremap():silent():desc("Package: Sync"),
  ["n|<leader>px"] = cmd("Lazy clean"):noremap():silent():desc("Package: Clean"),
  ["n|<leader>pc"] = cmd("Lazy check"):noremap():silent():desc("Package: Check"),
  ["n|<leader>pl"] = cmd("Lazy Log"):noremap():silent():desc("Package: Log"),
  ["n|<leader>pr"] = cmd("Lazy restore"):noremap():silent():desc("Package: Restore"),
  ["n|<leader>pp"] = cmd("Lazy profile"):noremap():silent():desc("Package: Profile"),

  -- mason server manager
  ["n|<leader>mm"] = cmd("Mason"):noremap():silent():desc("Mason: Show"),
  ["n|<leader>tt"] = cmd("TSModuleInfo"):noremap():silent():desc("Treesitter: Module list"),
}

bind.load_mapping(Package)

require("keymaps.builtins")
require("keymaps.plugins")