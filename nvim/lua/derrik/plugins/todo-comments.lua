return {

	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", { desc = "Todo" })


		require("todo-comments").setup()
	end,
}
