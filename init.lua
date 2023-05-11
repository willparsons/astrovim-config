return {
  updater = {
    branch = "main",
  },
  colorscheme = "vscode",
  polish = function()
    vim.api.nvim_create_augroup("Will", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Fix all eslint errors",
      pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
      command = "EslintFixAll",
      group = "Will",
    })

    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function() vim.highlight.on_yank() end,
      pattern = "*",
      group = "Will",
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      command = "%s/\\s\\+$//e",
      group = "Will",
    })
  end,
  lsp = {
    config = {
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--suggest-missing-includes",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--fallback-style=Chromium",
        },
      },
    },
  },
};
