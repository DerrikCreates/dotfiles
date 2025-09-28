return {
	"stevearc/conform.nvim",
	opts = {
		default_format_opts = {
			lsp_format = "fallback",
		},
		async = true,
		formatters_by_ft = {
			lua = { "stylua" },
		},
	},
	keys = {
		{ -- Customize or remove this keymap to your liking
			"<leader>F",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
}
