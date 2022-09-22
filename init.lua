-- =======================================================
-- ============ AstroNvim Configuration Table ============
-- =======================================================

local config = {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = true, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
  },

  colorscheme = "gruvbox",

  -- Set (n)vim options
  options = {
    opt = {
      relativenumber = true,
    },
    g = {
      mapleader = " ",
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {},
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {},
  },

  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- Configure plugins
  plugins = {
    init = {
      ["declancm/cinnamon.nvim"] = { disable = true },

      {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
          require("catppuccin").setup {
            transparent_background = true,
            term_colors = true,
            dim_inactive = {
              enabled = false,
              shade = "dark",
              percentage = 0.15,
            },
            styles = {
              comments = {},
              conditionals = {},
              loops = {},
              functions = {},
              keywords = {},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},
            },
            integrations = {
              -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
            },
          }
        end,
      },

      {
        "ellisonleao/gruvbox.nvim",
        config = function()
          require("gruvbox").setup {
            undercurl = true,
            underline = true,
            bold = true,
            italic = false,
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "", -- can be "hard", "soft" or empty string
            overrides = {},
            dim_inactive = false,
            transparent_mode = true,
          }
        end,
      },
    },

    aerial = {
      -- override keybinds to restore default behaviour for `{, }`
      on_attach = function() end,
    },

    ["null-ls"] = function(config)
      local null_ls = require "null-ls"

      config.sources = {
        null_ls.builtins.formatting.stylua,
      }

      config.on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config
    end,

    treesitter = {
      ensure_installed = { "lua" },
      rainbow = {
        enable = false,
      },
    },

    ["mason-lspconfig"] = {
      ensure_installed = { "sumneko_lua" },
    },

    ["mason-tool-installer"] = {
      ensure_installed = { "stylua" },
    },
  },

  ["which-key"] = {
    register_mappings = {
      n = {
        ["<leader>"] = {
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Fix all eslint errors",
      pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
      command = "EslintFixAll",
    })
  end,
}

return config
