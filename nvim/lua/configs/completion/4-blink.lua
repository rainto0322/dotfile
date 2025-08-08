return function()
  local icon = require("utils.icons")
  require("blink.cmp").setup {
    appearance = { kind_icons = icon.kind },
    sources = {
      default = { 'lsp', 'buffer', 'snippets', 'path', 'spell', 'tmux' },
      providers = require("configs.completion.source")
    },
    completion = {
      menu = {
        auto_show = true,
        border = 'rounded',
        draw = {
          columns = { { "kind_icon" }, { "label" } },
          components = {
            label = {
              width = { fill = true, max = 28 },
            }
          }
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        treesitter_highlighting = true,
        window = { border = "rounded" }
      }
    },
    signature = { enabled = true },
    keymap = {
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = { 'accept', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
    }
  }
end
