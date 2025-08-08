return function()
  local lspconfig = require('lspconfig')
  for server, config in pairs(require("completion.source.server")) do
    config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
    lspconfig[server].setup(config)
  end
end