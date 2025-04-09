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
    servers = {
      "gdscript",
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
      gdscript = {
        cmd = { "/home/will/godot-wsl-lsp/bin/godot-wsl-lsp", "--useMirroredNetworking" },
        filetypes = { "gd", "gdscript", "gdscript3" },
        root_dir = require("lspconfig.util").root_pattern("project.godot", ".git"),
      },
    },
    autocmds = {
      eslint_fix_on_save = false,
    },
  },
}
