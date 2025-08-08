local bind = require("utils.bind")
local map, cmd, callback = bind.map, bind.cmd, bind.callback
local help = require("keymaps.helpers")

local Builtins = {
  -- Save file
  ["nvi|<C-s>"] = cmd("write"):noremap():silent():desc("Editor: Save file"),

  -- ToggleMod
  ["ni|jk"] = map("<Esc>V"):noremap():silent():desc("Mode: toggle to visual line"),
  ["ni|kk"] = map("<Esc>v"):noremap():silent():desc("Mode: toggle to visual"),
  ["ni|aa"] = map("<Esc>vi"):noremap():silent():desc("Mode: toggle to visual select block"),

  -- Deletion
  ["i|<C-BS>"] = map("<C-w>"):noremap():silent():desc("Editor: Deleted preceding word"),
  ["ni|<C-Del>"] = cmd("normal daw"):noremap():silent():desc("Editor: Deleted following word"),

  ["n|ss"] = map("vit<Esc>gx"):noremap():silent(),
  -- Move
  ["nvi|<C-Up>"] = cmd("normal 3k"):noremap():silent():desc("Editor: Move up 3 line"),
  ["nvi|<C-Down>"] = cmd("normal 3j"):noremap():silent():desc("Editor: Move down 3 line"),

  -- Selection
  ["n|<C-a>"] = map("ggVG"):noremap():silent():desc("Editor: select all"),
  ["vi|<C-a>"] = map("<Esc>ggVG"):noremap():silent():desc("Editor: select all"),
  ["n|<S-Down>"] = map("vj"):noremap():silent():desc("Editor: select down line"),
  ["v|<S-Down>"] = map("j"):noremap():silent():desc("Editor: select down line"),
  ["i|<S-Down>"] = map("<Esc>vj"):noremap():silent():desc("Editor: select down line"),
  ["i|<S-Up>"] = map("<Esc>vk"):noremap():silent():desc("Editor: select down line"),
  ["n|<S-Up>"] = map("vk"):noremap():silent():desc("Editor: select up line"),
  ["v|<S-Up>"] = map("k"):noremap():silent():desc("Editor: select up line"),
  ["n|J"] = map("vj"):noremap():silent():desc("Editor: select down line"),
  ["v|J"] = map("j"):noremap():silent():desc("Editor: select down line"),
  ["n|K"] = map("vk"):noremap():silent():desc("Editor: select up line"),
  ["v|K"] = map("k"):noremap():silent():desc("Editor: select up line"),

  -- Move block
  ["n|<A-j>"] = map(":m .+1<CR>=="):noremap():silent():desc("Editor: Code move down"),
  ["n|<A-k>"] = map(":m .-2<CR>=="):noremap():silent():desc("Editor: Code move up"),
  ["v|<A-j>"] = map(":m '>+1<CR>gv=gv"):noremap():silent():desc("Editor: Code move down"),
  ["v|<A-k>"] = map(":m '<-2<CR>gv=gv"):noremap():silent():desc("Editor: Code move up"),

  -- Buffer Control
  ["nvi|<C-w>"] = callback(help.DeleteBuffer):noremap():silent():desc("Editor: Close buffer"),
  ["nvi|<C-q>"] = callback(help.DeleteBufferOther):noremap():silent():desc("Editor: Close buffer"),

  -- Command
  ["c|<C-r>"] = map([[\r]]):noremap(),
  ["nv|rr"] = callback(help.ReplaceAll):noremap():silent():desc("Editor: Replace all in cursor / select"),

}

bind.load_mapping(Builtins)
