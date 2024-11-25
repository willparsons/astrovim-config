---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.templ" },
  { import = "astrocommunity.pack.gleam" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.lsp.nvim-lint" },
  { import = "astrocommunity.editing-support.conform-nvim" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },

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
