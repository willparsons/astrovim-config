return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },
  opts = function(_, opts)
    local cmp = require "cmp"

    local additional_sources = {
      { name = "nvim_lsp_signature_help" },
    }

    opts.sources = cmp.config.sources(vim.tbl_deep_extend("force", opts.sources, additional_sources))
  end,
}
