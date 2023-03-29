return {
  updater = {
    branch = "main",
  },
  colorscheme = "catppuccin",
  polish = function()
    vim.api.nvim_create_augroup("Will", {})
    vim.api.nvim_create_augroup("YankHighlight", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Fix all eslint errors",
      pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
      command = "EslintFixAll",
      group = "Will",
    })

    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function() vim.highlight.on_yank() end,
      pattern = "*",
      group = "YankHighlight",
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      command = "%s/\\s\\+$//e",
      group = "Will",
    })
  end,
};
