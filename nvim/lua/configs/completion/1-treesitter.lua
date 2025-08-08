return function()
  local use_ssh = require("core.settings").use_ssh
  vim.api.nvim_set_option_value("foldmethod", "expr", {})
  vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})
  require("nvim-treesitter").setup {
    ensure_installed = {
      "javascript",
      "typescript",
      "json",
      "html",
      "css",
      "lua",
      "bash",
      "markdown",
      "yaml",
      "toml",
      "scss",
      "vue",
      "svelte"
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  }
  require("nvim-treesitter.install").prefer_git = true
  if use_ssh then
    local parsers = require("nvim-treesitter.parsers").get_parser_configs()
    for _, parser in pairs(parsers) do
      parser.install_info.url = parser.install_info.url:gsub("https://github.com/", "git@github.com:")
    end
  end
  vim.cmd("TSToggle highlight")
end
