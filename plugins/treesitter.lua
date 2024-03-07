return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- this only works if the tree-sitter cli is installed
      auto_install = true,
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
