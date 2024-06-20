---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.editing-support.conform-nvim" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },

  {
    "vuki656/package-info.nvim",
    enabled = false,
  },
}
