-- general vim config settings
vim.g.mapleader = " "
vim.api.nvim_set_option("clipboard","unnamed")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s %l %r"
vim.opt.numberwidth = 5

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='blue' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='magenta' })



