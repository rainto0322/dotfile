return function()
  local c = require("rose-pine.palette")
  require("rose-pine").setup {
    highlight_groups = {
      WinBar = { bg = c.highlight_low },
      WinBarNC = { bg = c.highlight_low },
      BufferLineFill = { bg = c.highlight_low },
      CursorLineNr = { fg = c.gold, bold = true },
      Mark = { fg = c.gold, bold = true },
      -- indent-blankline
      IblScope = { fg = c.love, bold = true },
      -- nvim-ufo
      MoreMsg = { bg = c.love, fg = c.text, bold = true, italic = true },
      UfoPreviewSbar = { bg = c.love, fg = c.text, bold = true, italic = true },
      -- vim-matchup
      MatchParen = { fg = c.love, bg = c.text, italic = true },
      -- telescope
      TelescopeMatching = { fg = c.love, bold = true, italic = true },
      -- blink
      BlinkCmpMenu = { bg = c.base },
      BlinkCmpMenuBorder = { bg = c.base },
      BlinkCmpMenuSelection = { fg = c.gold, bg = c.surface, bold = true },
      BlinkCmpLabelMatch = { fg = c.iris },
      BlinkCmpDoc = { bg = c.base },
      BlinkCmpDocBorder = { bg = c.base },
      -- alpha
      AlphaHeader = { fg = c.leaf, bold = true },
      AlphaButtons = { fg = c.love, bold = true, italic = true },
      AlphaShortcut = { fg = c.rose },
      AlphaFooter = { fg = c.gold },
      -- mark
      MarkSignHL = { fg = c.love },
      -- wilder
      CmpItemAbbrMatch = { fg = c.gold, italic = true }
    }
  }
  vim.cmd.colorscheme 'rose-pine'
end
