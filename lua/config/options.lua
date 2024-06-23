-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.colorcolumn = "80"
vim.api.nvim_create_autocmd("BufEnter", { command = "hi colorcolumn guibg=#414868" })
-- vim.opt.guifont = "JuliaMono:h14"

vim.diagnostic.config({ virtual_text = false })

-- quarto kickstart config
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- but open all by default
vim.opt.foldlevel = 99

