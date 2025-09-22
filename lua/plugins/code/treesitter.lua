return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      -- Parsers to install
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "latex",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "norg",
        "printf",
        "python",
        "query",
        "regex",
        "scss",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "typst",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      },

      sync_install = true,
      auto_install = true,
      ignore_install = {},

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },
      folds = { enable = true },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- Force treesitter to install parsers in $HOME
      local install = require("nvim-treesitter.install")
      install.prefer_git = true
      install.compilers = { "gcc", "clang" }
    end,
  },
}

