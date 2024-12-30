-- general vim config settings
vim.g.mapleader = " "
vim.api.nvim_set_option("clipboard","unnamed")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s %l %r"
vim.opt.numberwidth = 7

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='blue' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='magenta' })


vim.keymap.set("n", "<S-TAB>",":bprevious<cr>" )

vim.keymap.set("n", "<TAB>",":bnext<cr>" )

vim.keymap.set({"n","v"}, "<leader>bd",":bd<cr>",{desc = "Delete buffer"})

vim.keymap.set({"n","v"}, "<leader>bn",":bn<cr>",{desc = "Next buffer"})
vim.keymap.set({"n","v"}, "<leader>bp",":bp<cr>",{desc = "Previous buffer"})

