--general vim config settings
-- todo test
-- TODO asdf
vim.g.mapleader = " "
vim.api.nvim_set_option("clipboard", "unnamed")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s %l %r"
vim.opt.numberwidth = 7
vim.o.wrap = false

vim.o.title = true
vim.o.titlestring = "%{fnamemodify(getcwd(), ':t')}"

vim.o.smartcase = true

vim.keymap.set("n", "<S-TAB>", ":bprevious<cr>")

vim.keymap.set("n", "<TAB>", ":bnext<cr>")

vim.keymap.set({ "n", "v" }, "<leader>bd", ":bd<cr>", { desc = "Delete buffer" })

vim.keymap.set({ "n", "v" }, "<leader>bn", ":bn<cr>", { desc = "Next buffer" })
vim.keymap.set({ "n", "v" }, "<leader>bp", ":bp<cr>", { desc = "Previous buffer" })

vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap = true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true })

vim.keymap.set("n", "<leader>se", function()
	vim.diagnostic.open_float()
end, { desc = "Show line error" })

vim.opt.spell = true

-- Toggle spell checking
vim.api.nvim_set_keymap(
	"n",
	"<leader>sp",
	":set spell!<CR>",
	{ noremap = true, silent = true, desc = "Spell check toggle" }
)
