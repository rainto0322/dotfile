return {
  lua_ls = {},
  volar = {
    filetypes = { 'vue', 'javascript', 'typescript' },
    init_options = {
      vue = {
        hybridMode = true,
      },
    },
    settings = {
      vue = {
        server = { maxOldSpaceSize = 8092 },
      },
      typescript = {
        serverPlugins = { 'volar-typescript' },
      },
      javascript = {
        serverPlugins = { 'volar-typescript' },
      },
    },
  },
  vtsls = {
    filetypes = { 'vue', 'svelte', 'javascript', 'typescript' },
  },
  svelte = {
    filetypes = { 'svelte' },
  },
}
