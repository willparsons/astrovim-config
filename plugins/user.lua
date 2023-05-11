return {
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        config = function()
            require('vscode').setup({
                transparent = true,
                italic_comments = false,
            })
        end,
    }
};
