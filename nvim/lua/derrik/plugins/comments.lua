return {

	"numToStr/Comment.nvim",
	opts = {},

	config = function()
		require("Comment").setup({

			opleader = { line = "<leader>cc", block = "<leader>cC" },
		})
	end,
}
