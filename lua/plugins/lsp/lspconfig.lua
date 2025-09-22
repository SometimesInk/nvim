return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")

    -- Function to attach key mappings for LSP actions
    local on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "F", vim.diagnostic.open_float, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_prev, bufopts)
      vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_next, bufopts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
      -- vim.keymap.set("n", "gra", vim.lsp.buf.code_action, bufopts)
      -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
      -- vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
    end

    -- Setup LSP servers
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    })

    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.bashls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "bash-language-server", "start" },
      filetype = { "sh", "zsh", "make" },
    })

    lspconfig.ast_grep.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "ast-grep", "lsp" },
      filetypes = { -- https://ast-grep.github.io/reference/languages.html
        "c",
        "cpp",
        "rust",
        "go",
        "java",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "kotlin",
        "dart",
        "lua",
      },
      root_dir = util.root_pattern("sgconfig.yaml", "sgconfig.yml"),
    })

    lspconfig.csharp_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "csharp_ls" },
      filetypes = { "cs" },
    })
  end,
}
