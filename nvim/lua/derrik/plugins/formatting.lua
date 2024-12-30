return {

	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({

			formatters_by_ft = {
				css = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				htmp = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				csharp = {"csharpier"}
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
			})
		end, { desc = "format file or selection" })
	end,
}
