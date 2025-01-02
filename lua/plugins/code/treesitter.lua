return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      modules = {},
      sync_install = true,
      ignore_install = {},
      ensure_installed = {
        "c",
        "lua",
        "vimdoc",
        "vim",
        "bash",
        "markdown",
        "markdown_inline",
      },
      auto_install = true,
      highlight = {
        enable = true,  -- Ensure highlighting is enabled
        additional_vim_regex_highlighting = false,  -- Disables Vim regex highlighting
      },
      indent = { enable = true },
    },
  },
}
