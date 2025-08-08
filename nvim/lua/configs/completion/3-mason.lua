return function()
  local icon = require("utils.icons")
  require("mason").setup {
    ui = {
      width = 0.45,
      height = 0.6,
      icons = {
        package_installed = icon.package.Installed,
        package_pending = icon.package.Pending,
        package_uninstalled = icon.package.Uninstalled
      },
      border = "single",
    }
  }
  require("mason-lspconfig").setup {
    registries = "github:mason-org/mason-registry",
    ensure_installed = { "volar", "vtsls" },
    automatic_installation = true,
  }
end
