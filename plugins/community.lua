return {
  "AstroNvim/astrocommunity",

  -- imports
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.pack.typescript" },

  -- config
  {
    "kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
    },
  },

  -- the typescript pack adds this but I'd rather not have it
  {
    "vuki656/package-info.nvim",
    enabled = false,
  },
}
