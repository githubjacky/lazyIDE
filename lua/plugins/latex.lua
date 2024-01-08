return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "bibtex", "latex" })
            end
            if type(opts.highlight.disable) == "table" then
                vim.list_extend(opts.highlight.disable, { "latex" })
            else
                opts.highlight.disable = { "latex" }
            end
        end,
    },

    {
        "lervag/vimtex",
        lazy = false, -- lazy-loading will disable inverse search
        config = function()
            vim.api.nvim_create_autocmd({ "FileType" }, {
                group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
                pattern = { "bib", "tex" },
                callback = function()
                    vim.g.conceallevel = 2
                    vim.g.tex_conceal = "abdmg"
                end,
            })
            vim.g.vimtex_indent_enabled = 0
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        build = (not jit.os:find("Windows"))
                and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
            or nil,
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        opts = {
            history = true,
            delete_check_events = "TextChanged",
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
        },
        -- stylua: ignore
        keys = {
            {
            "<tab>",
            function()
                return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
            end,
            expr = true, silent = true, mode = "i",
            },
            { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
            { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
        },
        config = function()
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
        end,
    },
    {
        "brennier/quicktex",
        config = function()
            -- vim.g.quicktex_tex = {
            --     ' '  = "<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
            --     'm'   = '\( <+++> \) <++>',
            --     'prf' = "\\begin{proof}\<CR><+++>\<CR>\\end{proof}",
            -- }
            -- vim.g.quicktex_math = {
            --     ' '    : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
            --     'fr'   : '\mathcal{R} ',
            --     'eq'   : '= ',
            --     'set'  : '\{ <+++> \} <++>',
            --     'frac' : '\frac{<+++>}{<++>} <++>',
            --     'one'  : '1 ',
            --     'st'   : ': ',
            --     'in'   : '\in ',
            --     'bn'   : '\mathbb{N} ',
            -- }
        end,
    },
}
