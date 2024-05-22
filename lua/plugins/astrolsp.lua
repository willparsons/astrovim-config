---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    formatting = {
      format_on_save = {
        enabled = true,
      },
      disabled = {
        "lua_ls",
        "tsserver",
        "jsonls",
        "pyright",
        "eslint",
        "yamlls",
        "typescript-tools",
      },
    },
    ---@diagnostic disable: missing-fields
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
        eslint = {
          settings = {
            validate = "on",
            packageManager = "yarn",
            run = "onSave",
          },
        },
      },
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      eslint_fix_on_save = false,
    },
  },
}
