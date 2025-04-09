---@type LazySpec
return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
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
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_colors_override = { bg0 = { "#151818", "234" } }
    end,
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {
        default_mappings = false,
        mappings = {
          i = {
            j = {
              k = "<Esc>",
            },
          },
        },
      }
    end,
  },
}
