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
        "vtsls",
      },
    },
    features = {
      signature_help = true,
    },
    ---@diagnostic disable: missing-fields
    config = {
      eslint = {
        settings = {
          validate = "on",
          run = "onSave",
        },
      },
      vtsls = {
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = true,
          },
          javascript = {
            preferences = {
              importModuleSpecifier = "non-relative",
            },
          },
          typescript = {
            preferences = {
              importModuleSpecifier = "non-relative",
            },
          },
        },
      },
    },
    autocmds = {
      eslint_fix_on_save = false,
    },
  },
}
