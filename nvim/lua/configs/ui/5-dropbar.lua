return function()
  local icon = require("utils.icons")
  local utils = require("dropbar.utils")
  local sources = require("dropbar.sources")
  sources.symbols = {
    get_symbols = function(buf, win, cursor)
      local symbols = sources.path.get_symbols(buf, win, cursor)
      return { symbols[#symbols] }
    end,
  }
  require("dropbar").setup {
    bar = {
      hover = false,
      truncate = true,
      pick = { pivots = "etovxqpdygfblzhckisuran" },
      sources = function(buf)
        if vim.bo[buf].ft == "markdown" then
          return {
            sources.symbols,
            sources.markdown,
          }
        end
        if vim.bo[buf].buftype == "terminal" then
          return {
            sources.terminal,
          }
        end
        return {
          sources.symbols,
          utils.source.fallback({
            sources.treesitter,
          }),
        }
      end,
    },
    sources = {
      terminal = {
        winbar = false,
        name = "Terminal"
      },
    },
    filters = {
      exclude = {
        buftypes = { "terminal" },
        filetypes = { "toggleterm" }
      }
    }

  }
end
