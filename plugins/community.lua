return {
  "AstroNvim/astrocommunity",

  -- imports
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
  { import = "astrocommunity.colorscheme.nvim-juliana" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.pack.typescript" },

  -- config
  {
    "catppuccin",
    opts = { no_italic = true },
    lazy = false,
  },
  {
    "kanagawa.nvim",
    opts = {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
    },
    lazy = false,
  },
  {
    "nord.nvim",
    lazy = false,
  },
  {
    "nvim-juliana",
    lazy = false,
  },
  {
    "onedarkpro.nvim",
    lazy = false,
  },

  -- the typescript pack adds this but I'd rather not have it
  {
    "vuki656/package-info.nvim",
    enabled = false,
  },
}
