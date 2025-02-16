return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		"xzbdmw/colorful-menu.nvim",
		"Kaiser-Yang/blink-cmp-dictionary",
	},

	config = function()
		require("colorful-menu").setup({})
		require("blink.cmp").setup({

			signature = { enabled = true },
			cmdline = {
				keymap = {
					preset = "super-tab",
				},
			},
			keymap = {
				preset = "enter",
				["<C-J>"] = { "select_next", "fallback" },
				["<C-K>"] = { "select_prev", "fallback" },
				["<C-s>"] = { "show", "show_documentation", "hide_documentation" },
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "dictionary" },
				providers = {

					dictionary = {
						module = "blink-cmp-dictionary",
						name = "Dict",
						-- Make sure this is at least 2.
						-- 3 is recommended
						min_keyword_length = 3,

						opts = {
							-- options for blink-cmp-dictionary
							dictionary_files = { vim.fn.stdpath("config") .. "/" .. "dict/en_dict.txt" },

							separate_output = function(output)
								local items = {}

								-- You may need to change the pattern to match your dictionary files
								for line in output:gmatch("[^\r\n]+") do
									table.insert(items, {
										label = line,
										insert_text = line,
										-- If you want to disable the documentation feature, just set it to nil
										documentation = {
											get_command = "wn",
											get_command_args = { line, "-over" },
											resolve_documentation = function(output)
												return output
											end,
										},
									})
								end
								return items
							end,
						},
					},
				},
			},
			completion = {
				ghost_text = { enabled = false },
				documentation = { auto_show = true, auto_show_delay_ms = 500 },

				menu = {
					draw = {
						-- We don't need label_description now because label and label_description are already
						-- combined together in label by colorful-menu.nvim.
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				},
			},
		})
	end,

	opts_extend = { "sources.default" },
	version = "*",
}
