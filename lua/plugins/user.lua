---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        "neovim",
      }
      return opts
    end,
  },

  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jk" },
    },
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 500,
      stages = "fade",
      render = "wrapped-compact",
      max_width = 80,
      max_height = 100,
    },
  },
}
