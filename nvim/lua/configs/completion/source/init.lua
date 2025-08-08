return {
  cmdline = { enabled = false },
  lsp = {
    name = 'LSP',
    module = 'blink.cmp.sources.lsp',
    opts = {}, -- Passed to the source directly, varies by source

    --- NOTE: All of these options may be functions to get dynamic behavior
    --- See the type definitions for more information
    enabled = true,           -- Whether or not to enable the provider
    async = false,            -- Whether we should show the completions before this provider returns, without waiting for it
    timeout_ms = 200,         -- How long to wait for the provider to return before showing completions and treating it as asynchronous
    transform_items = nil,    -- Function to transform the items before they're returned
    should_show_items = true, -- Whether or not to show the items
    max_items = 50,           -- Maximum number of items to display in the menu
    min_keyword_length = 0,   -- Minimum number of characters in the keyword to trigger the provider
    -- If this provider returns 0 items, it will fallback to these providers.
    -- If multiple providers fallback to the same provider, all of the providers must return 0 items for it to fallback
    fallbacks = {},
    score_offset = 0, -- Boost/penalize the score of the items
    override = nil,   -- Override the source's functions
  },
  snippets = {
    module = 'blink.cmp.sources.snippets',
    opts = {
      friendly_snippets = true,
      search_paths = { vim.fn.stdpath('config') .. '/snippets' },
      global_snippets = { 'all' },
      extended_filetypes = {},
      ignored_filetypes = { "vim", "cmdline" },
      get_filetype = function(context)
        return vim.bo.filetype
      end,
      -- Set to '+' to use the system clipboard, or '"' to use the unnamed register
      clipboard_register = nil,
    }
  },
  tmux = {
    module = "blink-cmp-tmux",
    name = "tmux",
    -- default options
    opts = {
      all_panes = false,
      capture_history = false,
      -- only suggest completions from `tmux` if the `trigger_chars` are
      -- used
      triggered_only = false,
      trigger_chars = { "." }
    },
  },
  spell = {
    name = 'Spell',
    module = 'blink-cmp-spell',
    opts = {
      -- EXAMPLE: Only enable source in `@spell` captures, and disable it
      -- in `@nospell` captures.
      enable_in_context = function()
        local curpos = vim.api.nvim_win_get_cursor(0)
        local captures = vim.treesitter.get_captures_at_pos(
          0,
          curpos[1] - 1,
          curpos[2] - 1
        )
        local in_spell_capture = false
        for _, cap in ipairs(captures) do
          if cap.capture == 'spell' then
            in_spell_capture = true
          elseif cap.capture == 'nospell' then
            return false
          end
        end
        return in_spell_capture
      end,
    },
  },
}
