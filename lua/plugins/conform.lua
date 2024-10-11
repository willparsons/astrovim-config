local util = require "conform.util"

return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      prettierd = {
        cwd = util.root_file {
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.yml",
          ".prettierrc.yaml",
          ".prettierrc.json5",
          ".prettierrc.js",
          ".prettierrc.cjs",
          ".prettierrc.mjs",
          ".prettierrc.toml",
          "prettier.config.js",
          "prettier.config.cjs",
          "prettier.config.mjs",
        },
      },
    },
    log_level = vim.log.levels.DEBUG,
    formatters_by_ft = {
      yaml = { "prettierd" },
      lua = { "stylua" },
      markdown = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      graphql = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
    },
  },
}
