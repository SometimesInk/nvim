return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "prettier", "stylua" },
      c = { "clangformat" },

      ["_"] = { "trim_whitespace" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    formatters = {
      clangformat = {
        meta = {
          url = "https://clang.llvm.org/docs/ClangFormat.html",
          description = "Tool to format C/C++/… code according to a set of rules and heuristics.",
        },
        command = "clang-format",
        args = { "-assume-filename", "$FILENAME" },
        range_args = function(ctx)
          local start_offset, end_offset = require("conform.util").get_offsets_from_range(ctx.buf, ctx.range)
          local length = end_offset - start_offset
          return {
            "-assume-filename",
            "$FILENAME",
            "--offset",
            tostring(start_offset),
            "--length",
            tostring(length),
          }
        end,
      },
    },
  },
  keys = {
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file (or range in visual mode)" }),
  },
}
