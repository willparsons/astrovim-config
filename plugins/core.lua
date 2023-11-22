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
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "css",
        "dockerfile",
        "graphql",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "make",
        "rust",
        "tsx",
        "typescript",
        "yaml",
      },
    },
  },
}
