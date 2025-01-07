return {

	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/lazydev.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({})

		local keymap = vim.keymap

		local opts = { silent = true }

		opts.desc = "Show LSP references"
		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "Go to declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP definitions"
		keymap.set("n", "gd", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Show buffer diagnostics"
		keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)


		opts.desc = "Show documentation under cursor"
		keymap.set("n", "<leader>sh", vim.lsp.buf.hover, opts)

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

		opts.desc = "Toggle Inlay Hints"
		keymap.set("n", "<leader>lI", function()
			vim.lsp.inlay_hint.enable(0, not lsp.inlay_hint.is_enabled())
		end, opts)

		-- LUA LSP
	end,
}
