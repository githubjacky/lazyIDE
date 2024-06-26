local Util = require("lazyvim.util")

return {
    {
        "nvim-telescope/telescope.nvim",
        commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
        cmd = "Telescope",
        version = false, -- telescope did only one release, so use HEAD for now
        keys = {
            -- { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
            { "<leader>,", false },

            -- { "<leader>/", Util.telescope("live_grep"), desc = "Grep (root dir)" },
            { "<leader>/", false },

            -- { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
            { "<leader>:", false },

            -- { "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
            { "<leader><space>", false },

            -- buffer
            { "<leader>bs", "<cmd>Telescope buffers<cr>", desc = "Switch Buffer" },

            -- files
            { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
            -- { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
            { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },

            -- git
            { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
            { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
            -- search
            { '<leader>s"', " cmd>Telescope registers<cr>", desc = "Registers" },
            { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
            { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
            { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
            { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
            { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
            { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
            -- { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
            -- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
            { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
            { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
            { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
            { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
            { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
            { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
            -- { "<leader>sw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
            -- { "<leader>sW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
            -- { "<leader>sw", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
            -- { "<leader>sW", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
            {
                "<leader>uC",
                Util.telescope("colorscheme", { enable_preview = true }),
                desc = "Colorscheme with preview",
            },
            {
                "<leader>ss",
                Util.telescope("lsp_document_symbols", {
                    symbols = {
                        "Class",
                        "Function",
                        "Method",
                        "Constructor",
                        "Interface",
                        "Module",
                        "Struct",
                        "Trait",
                        "Field",
                        "Property",
                    },
                }),
                desc = "Goto Symbol",
            },
            {
                "<leader>sS",
                Util.telescope("lsp_dynamic_workspace_symbols", {
                    symbols = {
                        "Class",
                        "Function",
                        "Method",
                        "Constructor",
                        "Interface",
                        "Module",
                        "Struct",
                        "Trait",
                        "Field",
                        "Property",
                    },
                }),
                desc = "Goto Symbol (Workspace)",
            },
        },
        opts = {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                mappings = {
                    i = {
                        ["<c-t>"] = function(...)
                            return require("trouble.providers.telescope").open_with_trouble(...)
                        end,
                        ["<a-t>"] = function(...)
                            return require("trouble.providers.telescope").open_selected_with_trouble(...)
                        end,
                        ["<a-i>"] = function()
                            local action_state = require("telescope.actions.state")
                            local line = action_state.get_current_line()
                            Util.telescope("find_files", { no_ignore = true, default_text = line })()
                        end,
                        ["<a-h>"] = function()
                            local action_state = require("telescope.actions.state")
                            local line = action_state.get_current_line()
                            Util.telescope("find_files", { hidden = true, default_text = line })()
                        end,
                        ["<C-Down>"] = function(...)
                            return require("telescope.actions").cycle_history_next(...)
                        end,
                        ["<C-Up>"] = function(...)
                            return require("telescope.actions").cycle_history_prev(...)
                        end,
                        ["<C-f>"] = function(...)
                            return require("telescope.actions").preview_scrolling_down(...)
                        end,
                        ["<C-b>"] = function(...)
                            return require("telescope.actions").preview_scrolling_up(...)
                        end,
                    },
                    n = {
                        ["q"] = function(...)
                            return require("telescope.actions").close(...)
                        end,
                    },
                },
            },
        },
        config = function()
            require("telescope").setup({
                load_extension = {
                    "bibtex",
                },
                extensions = {
                    bibtex = {
                        depth = 1,
                        -- Depth for the *.bib file
                        global_files = { "~/Library/texmf/bibtex/bib/Zotero.bib" },
                        -- Path to global bibliographies (placed outside of the project)
                        search_keys = { "author", "year", "title" },
                        -- Define the search keys to use in the picker
                        citation_format = "{{author}} ({{year}}), {{title}}.",
                        -- Template for the formatted citation
                        citation_trim_firstname = true,
                        -- Only use initials for the authors first name
                        citation_max_auth = 2,
                        -- Max number of authors to write in the formatted citation
                        -- following authors will be replaced by "et al."
                        custom_formats = {
                            { id = "citet", cite_maker = "\\citet{%s}" },
                        },
                        -- Custom format for citation label
                        format = "citet",
                        -- Format to use for citation label.
                        -- Try to match the filetype by default, or use 'plain'
                        context = true,
                        -- Context awareness disabled by default
                        context_fallback = true,
                        -- Fallback to global/directory .bib files if context not found
                        -- This setting has no effect if context = false
                        wrap = false,
                        -- Wrapping in the preview window is disabled by default
                    },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        keys = {
            {
                "<leader>sB",
                "<cmd>Telescope file_browser path=/Users/jackyyeh/github<cr>",
                desc = "File Browser",
            },
        },
        config = function()
            require("telescope").load_extension("file_browser")
        end,
    },
}
