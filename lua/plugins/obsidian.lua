local function map(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end
local opt = { noremap = true }

return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = "ocw",
                path = "~/github/obsidian/ocw",
            },
            {
                name = "plan",
                path = "~/github/obsidian/plan",
            },
            {
                name = "research",
                path = "~/github/obsidian/research",
            },
        },
        templates = {
            subdir = "template",
            date_format = "%a, %m %d, %Y",
            time_format = "%H:%M",
        },

        -- see below for full list of options 👇
    },
    mappings = {
        ["<space>og"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
    },
}
