return {

	"GustavEikaas/easy-dotnet.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		require("easy-dotnet").setup()
		vim.keymap.set("n","<leader>bb",function()
			require("easy-dotnet").build_quickfix()
		end)
	end,
	 
}
