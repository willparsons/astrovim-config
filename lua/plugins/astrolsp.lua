local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

-- TODO: this is a bit odd,
-- it makes the most sense that people will install biome as a dependency in their project, but they don't HAVE to...
-- but if biome.json doesn't exist and its there's no lock, lets just assume we're not doing shit
local function biome_cmd()
  if file_exists "package-lock.json" then return { "npx", "biome", "lsp-proxy" } end
  if file_exists "yarn.lock" then return { "yarn", "biome", "lsp-proxy" } end
  return nil
end

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
    servers = {
      "biome",
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
      biome = {
        cmd = biome_cmd(),
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
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      eslint_fix_on_save = false,
    },
  },
}
