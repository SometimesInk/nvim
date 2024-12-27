return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "prettier",

        -- Markdown
        -- "markdownlint-cli2",
        "markdown-toc",

        -- C
        "codelldb",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "shellcheck",
          "shfmt",
          "flake8",
          "prettier",

          -- Markdown
          -- "markdownlint-cli2",
          "markdown-toc",

          -- C
          "codelldb",
        },
      })
    end,
  },
}
