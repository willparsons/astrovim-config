return {
  "AstroNvim/astrocommunity",

  -- imports
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.colorscheme.nordic-nvim" },
  { import = "astrocommunity.pack.typescript" },

  -- config
  {
    "kanagawa.nvim",
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
