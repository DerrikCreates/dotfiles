return {

	"scottmckendry/cyberdream.nvim",
	dependencies = { "navarasu/onedark.nvim", "Mofiqul/vscode.nvim" },

	lazy = false,
	priority = 1000,
	config = function()
		-- require("onedark").setup({
		-- 	style = "deep",
		-- })
		-- vim.cmd("colorscheme onedark")

		require("vscode").setup({})
		vim.cmd.colorscheme("vscode")

		--	vim.cmd("colorscheme cyberdream")
	end,
}
