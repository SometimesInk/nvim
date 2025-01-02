-- mason-lspconfig.lua
return {
  'williamboman/mason-lspconfig.nvim',
  opts = {
    ensure_installed = {
      'lua_ls',
      'clangd',
      'bashls'
    },
  },
}
