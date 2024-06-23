return {
    { "niuiic/core.nvim" },
    {
        "neovim/nvim-lspconfig",
        opes = {
            servers = {
                typst_lsp = {
                    settings = {
                        exportPdf = "onType",
                    },
                },
            },
        },
    },
    {
        "chomosuke/typst-preview.nvim",
        -- lazy = false, -- or ft = 'typst'
        ft = "typst",
        version = "0.3.*",
        build = function()
            require("typst-preview").update()
        end,
    },
}
