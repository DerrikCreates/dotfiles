return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	config = function()
		require("mason-tool-installer").setup({

			ensure_installed = {

				"stylua",
				"omnisharp",
				"html-lsp",
				"lua-language-server",
				"csharpier",
				"prettier",
			},
		})
	end,
}
