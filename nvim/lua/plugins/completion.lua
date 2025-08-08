local completion = {}

completion["nvim-treesitter/nvim-treesitter"] = {
  lazy = true,
  build = function()
    if #vim.api.nvim_list_uis() > 0 then
      vim.api.nvim_command([[TSUpdate]])
    end
  end,
  event = "BufReadPre",
  config = require("completion.1-treesitter"),
  dependencies = {
    { "mfussenegger/nvim-treehopper" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "windwp/nvim-ts-autotag" },
    { "hiphish/rainbow-delimiters.nvim" },
    { "nvim-treesitter/nvim-treesitter-refactor" },
    { "andymass/vim-matchup" },
  }
}

completion["neovim/nvim-lspconfig"] = {
  lazy = true,
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  dependencies = { 'saghen/blink.cmp' },
  config = require("completion.2-lspconfig"),
}

completion["mason-org/mason.nvim"] = {
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason-org/mason-lspconfig.nvim" },
  config = require("completion.3-mason"),
}

completion["saghen/blink.cmp"] = {
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    { "saghen/blink.compat" },
    { "rafamadriz/friendly-snippets" },
    { "Wscats/html-snippets" },
    { "mgalliou/blink-cmp-tmux" },
    { "ribru17/blink-cmp-spell" }
  },
  config = require("completion.4-blink"),
}

return completion
