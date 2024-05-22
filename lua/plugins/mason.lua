---@type LazySpec
return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      handlers = {
        -- biome lsp can take care of this
        biome = function() end,
      },
    },
  },
}
