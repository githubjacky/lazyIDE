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

-- repl
local Terminal = require("toggleterm.terminal").Terminal
local julia_repl = Terminal:new({ cmd = "julia --project=.", hidden = true })
local Python_repl = Terminal:new({ cmd = "python", hidden = true })
local IPython_repl = Terminal:new({ cmd = "ipython", hidden = true })
local r_repl = Terminal:new({ cmd = "R", hidden = true })
local stata_repl = Terminal:new({ cmd = "stata-se", hidden = true })

function _julia_toggle()
  julia_repl:toggle()
end

function _Python_toggle()
  Python_repl:toggle()
end

function _IPython_toggle()
  IPython_repl:toggle()
end

function _R_toggle()
  r_repl:toggle()
end

function _Stata_toggle()
  stata_repl:toggle()
end

map("n", "<leader>ctj", "<cmd>lua _julia_toggle()<cr>", { noremap = true, silent = true, desc = "Julia Repl" })
map("n", "<leader>cti", "<cmd>lua _IPython_toggle()<cr>", { noremap = true, silent = true, desc = "Ipytohn Repl" })
map("n", "<leader>ctp", "<cmd>lua _Python_toggle()<cr>", { noremap = true, silent = true, desc = "Ipytohn Repl" })
map("n", "<leader>ctr", "<cmd>lua _R_toggle()<cr>", { noremap = true, silent = true, desc = "R Repl" })
map("n", "<leader>cts", "<cmd>lua _Stata_toggle()<cr>", { noremap = true, silent = true, desc = "Stata-SE 16.0 Repl" })

local Util = require("lazyvim.util")
map("n", "<leader>cy", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>cL", Util.changelog, { desc = "LazyVim Changelog" })

-- terminal
map("t", "<c-n>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("n", "<c-u>", "<cmd>hide<cr>", { desc = "Hide Terminal" })

map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
--
-- code block
map("n", "<leader>cbb", "o```{bash}<cr>```<esc>O", { desc = "bash code block" })
map("n", "<leader>cbr", "o```{r}<cr>```<esc>O", { desc = "R code block" })
map("n", "<leader>cbp", "o```{python}<cr>```<esc>O", { desc = "Python code block" })
map("n", "<leader>cbj", "o```{julia}<cr>```<esc>O", { desc = "Julia code block" })
map("n", "<leader>cbJ", "o```{juliadoctest}<cr>```<esc>O", { desc = "Julia Doctest code block" })
map("n", "<leader>cbs", "o```{sql}<cr>```<esc>O", { desc = "stata code block" })
map("n", "<leader>cbS", "o```{sql}<cr>```<esc>O", { desc = "SQL code block" })
