return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	keys = {
		{ "go", "<cmd>Oil<cr>", mode = "n" },
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
}
