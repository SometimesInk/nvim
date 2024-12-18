return {
  -- use mini.starter instead of alpha
  --{ import = "lazyvim.plugins.extras.ui.mini-starter" },
  -- removed to use alpha instead

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- Latex language
  { import = "lazyvim.plugins.extras.lang.tex" },

  -- C language with Clangd
  { import = "lazyvim.plugins.extras.lang.clangd" },
}
