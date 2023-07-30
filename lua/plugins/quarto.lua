-- This is a config that can be merged with your
-- existing LazyVim config.
--
-- It configures all plugins necessary for quarto-nvim,
-- such as adding its code completion source to the
-- completion engine nvim-cmp.
-- Thus, instead of having to change your configuration entirely,
-- this takes your existings config and adds on top where necessary.

return {

    {
        "quarto-dev/quarto-nvim",
        dev = false,
        -- tag = nil,
        -- branch = 'nightly',
        dependencies = {
            {
                "jmbuhr/otter.nvim",
                dev = false,
            },

            -- optional
            {
                "quarto-dev/quarto-vim",
                ft = "quarto",
                dependencies = { "vim-pandoc/vim-pandoc-syntax" },
                -- note: needs additional syntax highlighting enabled for markdown
                --       in `nvim-treesitter`
                config = function()
                    -- conceal can be tricky because both
                    -- the treesitter highlighting and the
                    -- regex vim syntax files can define conceals

                    -- see `:h conceallevel`
                    vim.opt.conceallevel = 1

                    -- disable conceal in markdown/quarto
                    vim.g["pandoc#syntax#conceal#use"] = false

                    -- embeds are already handled by treesitter injectons
                    vim.g["pandoc#syntax#codeblocks#embeds#use"] = false
                    vim.g["pandoc#syntax#conceal#blacklist"] = { "codeblock_delim", "codeblock_start" }

                    -- but allow some types of conceal in math regions:
                    -- see `:h g:tex_conceal`
                    vim.g["tex_conceal"] = "gm"
                end,
            },
        },
        config = function()
            vim.opt.conceallevel = 1

            require("quarto").setup({
                closePreviewOnExit = true,
                lspFeatures = {
                    enabled = true,
                    languages = {
                        "r",
                        "python",
                        "julia",
                        "bash",
                        "lua",
                        "html",
                        "css",
                        "javascript",
                        "lua",
                        "vim",
                        "yaml",
                        "sql",
                    },
                    chunks = "curly", -- 'curly' or 'all'
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" },
                    },
                    completion = {
                        enabled = true,
                    },
                },
                keymap = {
                    hover = "K",
                    definition = "gd",
                },
            })
        end,
    },

    -- send code from python/r/qmd documets to a terminal or REPL
    -- like ipython, R, bash
    {
        "jpalardy/vim-slime",
        init = function()
            vim.b["quarto_is_" .. "python" .. "_chunk"] = false
            Quarto_is_in_python_chunk = function()
                require("otter.tools.functions").is_otter_language_context("python")
            end

            vim.cmd([[
        let g:slime_dispatch_ipython_pause = 100
        function SlimeOverride_EscapeText_quarto(text)
        call v:lua.Quarto_is_in_python_chunk()
        if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
        return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
        else
        return a:text
        end
        endfunction
        ]])

            vim.g.slime_target = "neovim"
            vim.g.slime_python_ipython = 1
        end,
    },

    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                pyright = {},
                r_language_server = {},
                julials = {},
                marksman = {
                    -- also needs:
                    -- $home/.config/marksman/config.toml :
                    -- [core]
                    -- markdown.file_extensions = ["md", "markdown", "qmd"]
                    filetypes = { "markdown", "quarto" },
                    root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
                },
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "html",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "bash",
                "html",
                "css",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "vim",
                "yaml",
                "python",
                "julia",
                "r",
                "sql",
            },
        },
    },
}
