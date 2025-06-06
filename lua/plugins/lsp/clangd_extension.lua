return {
  "p00f/clangd_extensions.nvim",
  config = true,
  opts = {
    inlay_hints = {
      inline = false,
    },
    ast = {
      role_icons = {
        type = "",
        declaration = "",
        expression = "",
        specifier = "",
        statement = "",
        ["template argument"] = "",
      },
      kind_icons = {
        Compound = "",
        Recovery = "",
        TranslationUnit = "",
        PackExpansion = "",
        TemplateTypeParm = "",
        TemplateTemplateParm = "",
        TemplateParamObject = "",
      },
    },
  },
  keys = {
    { "<leader>h", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header" },
  },
}
