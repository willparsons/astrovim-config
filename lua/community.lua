---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.lsp.nvim-lint" },
  { import = "astrocommunity.editing-support.conform-nvim" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.colorscheme.catppuccin" },

  {
    "vuki656/package-info.nvim",
    enabled = false,
  },

  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
  },
}
