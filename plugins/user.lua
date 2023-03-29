return {
    {
        "catppuccin/nvim",
        lazy = false,
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
        "neanias/everforest-nvim",
        config = function()
            require("everforest").setup({
                background = "hard",
                transparent_background_level = 2
            })
        end
    },

    {
        "ramojus/mellifluous.nvim",
        dependencies = { "rktjmp/lush.nvim" },
        lazy = false,
        config = function()
            require("mellifluous").setup()
        end
    },

    {
        "xiyaowong/transparent.nvim",
        lazy = false,
    },
};
