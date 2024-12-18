return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure installed
      opts.highlight = opts.highlight or {}
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "tsx",
          "typescript",
          "bibtex",
          "c",
        })
      end

      -- Disable highlight
      if type(opts.highlight.disable) == "table" then
        vim.list_extend(opts.highlight.disable, {
          "latex",
        })
      else
        opts.highlight.disable = { "latex" }
      end
    end,
  },
}
