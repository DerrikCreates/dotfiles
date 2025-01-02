return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {},

	config = function()
		require("trouble").setup({})
	end
}
