vim.api.nvim_create_augroup("Will", { clear = true })

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

local sysname = vim.loop.os_uname().sysname

if sysname ~= "Darwin" then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = false,
  }
end
