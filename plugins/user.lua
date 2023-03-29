return {
    {
        "ramojus/mellifluous.nvim",
        dependencies = { "rktjmp/lush.nvim" },
        lazy = false,
        config = function()
            require("mellifluous").setup()
        end
    },
};
