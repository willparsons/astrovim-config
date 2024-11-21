return {
  "stevearc/conform.nvim",
  opts = {
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
