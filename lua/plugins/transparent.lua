return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({ -- Optional, you don't have to run setup.
            transparent = vim.g.transparent_enabled,
            groups = { -- table: default groups
                "Normal",
                "NormalNC",
                "Comment",
                "Constant",
                "Special",
                "Identifier",
                "Statement",
                "PreProc",
                "Type",
                "Underlined",
                "Todo",
                "String",
                "Function",
                "Conditional",
                "Repeat",
                "Operator",
                "Structure",
                "LineNr",
                "NonText",
                "SignColumn",
                "CursorLine",
                "CursorLineNr",
                "StatusLine",
                "StatusLineNC",
                "EndOfBuffer",
            },
            extra_groups = {}, -- table: additional groups that should be cleared
            exclude_groups = {}, -- table: groups you don't want to clear
        })
        require("transparent").clear_prefix("lualine")
        require("transparent").clear_prefix("NeoTree")
        require("transparent").clear_prefix("Telescope")
        require("transparent").clear_prefix("ToggleTerm")
        require("transparent").clear_prefix("LazyVim")
    end,
}
