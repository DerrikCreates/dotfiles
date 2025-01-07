return {

	"scottmckendry/cyberdream.nvim",
	dependencies = "navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "deep",
		})

	--	vim.cmd("colorscheme cyberdream")
		vim.cmd("colorscheme onedark")
	end,
}
