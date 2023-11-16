return {
  updater = {
    branch = "main",
  },
  colorscheme = "kanagawa",
  lsp = {
    setup_handlers = {
      -- add custom handler
      tsserver = function(_, opts)
        remove parts of `tsserver` options
        vim.tbl_map(function(k) opts[k] = nil end, {
          "_setup_buffer",
          "cmd",
          "document_config",
          "name",
          "setup",
        })

        require("typescript-tools").setup(opts)
      end,
    },
  },
}
