return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",

      -- Markdown
      "markdownlint-cli2",
      "markdown-toc",

      -- C
      "codelldb",
    },
  },
}
