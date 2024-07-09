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

  {
    "mrjones2014/smart-splits.nvim",
    opts = {
      multiplexer_integration = false,
    },
  },

  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_float_style = "dim"
    end,
  },
}
