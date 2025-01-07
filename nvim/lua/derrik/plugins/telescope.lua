return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },

	config = function()
		local tele = require("telescope")
		local actions = require("telescope.actions")

		tele.setup({
			extensions = { fzf = {} },
			defaults = {
				layout_strategy = "vertical",
				path_display = { "smart" },
				layout_config = { height = 0.95, preview_cutoff = 0 },

				mappings = {

					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = { ["<C-j>"] = actions.move_selection_next, ["<C-k>"] = actions.move_selection_previous },
				},
			},
		})

		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")

		--		vim.keymap.set("n", "<leader>sm", { desc = "Show Marks" })

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope Find String (grep)" })

		vim.keymap.set("n", "<leader>lsd", builtin.lsp_document_symbols, { desc = "Document Symbols" })
		vim.keymap.set("n", "<leader>lsw", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })
		vim.keymap.set(
			"n",
			"<leader>lsy",
			builtin.lsp_dynamic_workspace_symbols,
			{ desc = "Dynamic Workspace Symbols" }
		)

		vim.keymap.set("n", "<leader>en", function()
			require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Edit neovim config" })

		vim.keymap.set("n", "<leader>ep", function()
			require("telescope.builtin").find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
		end, { desc = "Search Plugins" })

		--These are not supported by the roslyn lsp yet?
		vim.keymap.set("n", "<leader>lci", builtin.lsp_incoming_calls, { desc = "Incoming Calls" })
		vim.keymap.set("n", "<leader>lco", builtin.lsp_outgoing_calls, { desc = "Outgoing Calls" })

		vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = "Dianostics" })
		vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "References" })

		vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, { desc = "Implementation" })
		vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "Definitions" })

		vim.keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "Type Definitions" })

		vim.keymap.set("n", "<leader>sT", builtin.treesitter, { desc = "Treesitter Picker" })

		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "List Buffers" })

		vim.keymap.set("n", "<leader>sq", builtin.quickfix, { desc = "Show Quick Fix" })
	end,
}
