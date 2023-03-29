return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        "neovim"
      }
      return opts
    end,
  },
}
