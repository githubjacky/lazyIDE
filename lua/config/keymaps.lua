-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

local opt = { noremap = true }

map("i", "kj", "<Esc>", opt)
map("v", "kj", "<Esc>", opt)

-- naviage inline
map("n", "<Tab>", "$", opt)
map("n", "<S-Tab>", "0", opt)
map("v", "<Tab>", "$", opt)
map("v", "<S-Tab>", "0", opt)

-- intent
map("n", ">", "a<C-t><Esc>", opt)
map("n", "<", "a<C-d><Esc>", opt)

-- quit
map("n", "<leader>qc", "<cmd>q<cr>", { desc = "quit current window" })

-- comment
map("n", "<leader>/", "gcc", { remap = true, desc = "line comment" })
map("v", "<leader>/", "gc", { remap = true, desc = "block comment" })

-- save
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })

-- modify which key
require("which-key").register({
  ["<leader>"] = {
    t = { name = "+terminal" },
  },
})

-- repl
map("n", "<leader>ctt", "<cmd>split term://$SHELL<cr>", { desc = "new terminal below" })
map("n", "<leader>ctr", "<cmd>split term://R<cr>", { desc = "new R repl below" })
map("n", "<leader>ctp", "<cmd>split term://python<cr>", { desc = "new Python repl below" })
map("n", "<leader>cti", "<cmd>split term://ipython<cr>", { desc = "new IPython repl below" })
map("n", "<leader>ctj", "<cmd>split term://julia --project=.<cr>", { desc = "new Julia repl below" })
map("n", "<leader>cts", "<cmd>split term://stata-se<cr>", { desc = "new StataSE 16.0 console below" })
--
-- code block
map("n", "<leader>cbb", "o```{bash}<cr>```<esc>O", { desc = "bash code block" })
map("n", "<leader>cbr", "o```{r}<cr>```<esc>O", { desc = "R code block" })
map("n", "<leader>cbp", "o```{python}<cr>```<esc>O", { desc = "Python code block" })
map("n", "<leader>cbj", "o```{julia}<cr>```<esc>O", { desc = "Julia code block" })
map("n", "<leader>cbJ", "o```{juliadoctest}<cr>```<esc>O", { desc = "Julia Doctest code block" })
map("n", "<leader>cbs", "o```{sql}<cr>```<esc>O", { desc = "stata code block" })
map("n", "<leader>cbS", "o```{sql}<cr>```<esc>O", { desc = "SQL code block" })

local Util = require("lazyvim.util")
map("n", "<leader>cy", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>cL", Util.changelog, { desc = "LazyVim Changelog" })

map("n", "<leader>cs", "<cmd>SlimeSendCurrentLine<cr>", { desc = "send code to terminal via vim slime" })
map("v", "<leader>cs", "<cmd>SlimeSend<cr>", { desc = "send code to terminal via vim slime" })

-- terminal
map("t", "<c-j>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
