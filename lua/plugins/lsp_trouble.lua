return {
  -- change trouble config
  {
    "folke/trouble.nvim",
    enabled = false,
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },

    -- Disable the plugin for ".h" files
    cond = function()
      return vim.fn.expand("%:e") ~= "h" -- Disable if the file extension is ".h"
    end,
  },
}
