return {

	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
	},

	config = function()
		-- telling vim to treat .xaml files as .xml
		vim.filetype.add({ extension = { xaml = "xml" } })
		vim.filetype.add({ extension = { axaml = "xml" } })
		local ts = require("nvim-treesitter.configs")
		ts.setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"c_sharp",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},

			incremental_selection = {
				enable = true,
				keymaps = {

					init_selection = "<cr>",
					node_incremental = ";",
					scope_incremental = "false",
					node_decremental = ",",
				},
			},
		})
	end,

	opts = {},
}
