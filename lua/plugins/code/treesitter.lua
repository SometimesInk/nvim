return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
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
        "make",

        "css",
        "latex",
        "norg",
        "scss",
        "svelte",
        "typst",
        "vue"
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
