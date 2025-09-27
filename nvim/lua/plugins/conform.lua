return {
	"stevearc/conform.nvim",
	opts = {
		async = true,
		formatters_by_ft = { lua = { "stylua" } },
		formatters = {},

		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
