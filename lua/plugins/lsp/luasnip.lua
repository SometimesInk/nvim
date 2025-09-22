return {
  "l3mon4d3/LuaSnip",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    --local luasnip = require("luasnip")

    -- Load friendly-snippets (VSCode format)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Load your own Lua-based snippets
    require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/lua/snippets", -- put snippets here
    })
  end,
}
