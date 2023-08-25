return function()
  vim.api.nvim_create_augroup("Will", { clear = true })

  vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "Fix all eslint errors",
    pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
    group = "Will",
    callback = function()
      if vim.fn.exists ":EslintFixAll" > 0 then vim.cmd "EslintFixAll" end
    end,
  })

  -- highlight on yank
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() vim.highlight.on_yank() end,
    pattern = "*",
    group = "Will",
  })

  -- strip trailing whitescape
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e",
    group = "Will",
  })
end
