local config = {
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
  },

  header = {
    "neovim"
  },

  colorscheme = "material",

  options = {
    opt = {
      shiftwidth = 4,
      tabstop = 4,
      spell = false,
    },
    g = {},
  },

  lsp = {
    mappings = {
      n = {},
    },

    ["server-settings"] = {},
  },

  mappings = {
    n = {
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
    },
  },

  plugins = {
    init = {
      ["akinsho/toggleterm.nvim"] = { disable = true },

      {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
          -- latte, frappe, macchiato, mocha (lightest -> darkest)
          vim.g.catppuccin_flavour = "mocha"
          require("catppuccin").setup({
            styles = {
              comments = {},
              conditionals = {},
            },
          })
        end,
      },

      {
        "marko-cerovac/material.nvim",
        config = function()
          require('material').setup({
            plugins = {
              "dashboard",
              "gitsigns",
              "indent-blankline",
              "nvim-cmp",
              "telescope",
              "which-key",
            },

            async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
          })
          vim.g.material_style = "darker"
        end
      }
    },

    alpha = function(config)
      config.layout[#config.layout + 1] = {
        type = "text",
        val = {
          ---@diagnostic disable-next-line: undefined-global
          string.format(" Loaded %d plugins", vim.tbl_count(packer_plugins)),
        },
        opts = { position = "center", hl = "DashboardFooter" },
      }

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

  polish = function()
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Fix all eslint errors",
      pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
      command = "EslintFixAll",
    })

    vim.api.nvim_create_augroup("YankHighlight", { clear = true })
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function() vim.highlight.on_yank() end,
      group = "YankHighlight",
      pattern = "*",
    })
  end,
}

return config
