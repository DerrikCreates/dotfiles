return {
	"saghen/blink.cmp",
	--commit = "69fe0ed74c48ba511fdc6c1846cf45f8d20cf67b",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		"xzbdmw/colorful-menu.nvim",
		"ribru17/blink-cmp-spell",
		--"Kaiser-Yang/blink-cmp-dictionary",
	},

	version = "*",
	build = "cargo build --release",

	config = function()
		require("colorful-menu").setup({})
		require("blink.cmp").setup({

			signature = { enabled = true },
			cmdline = {
				completion = { menu = { auto_show = true } },
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
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
					"spell",
				},
				providers = {

					spell = {

						name = "Spell",
						module = "blink-cmp-spell",
						-- Setting custom icons in blink.cmp providers
						transform_items = function(ctx, items)
							for _, item in ipairs(items) do
								item.kind_icon = ""
								item.kind_name = "Spell"
								item.kind_hl = "Spellhl"
							end
							return items
						end,

						opts = {
							preselect_current_word = false,
							use_cmp_spell_sorting = true,

							--[[ 							-- EXAMPLE: Only enable source in `@spell` captures, and disable it
							-- in `@nospell` captures.
							enable_in_context = function()
								local curpos = vim.api.nvim_win_get_cursor(0)
								local captures = vim.treesitter.get_captures_at_pos(0, curpos[1] - 1, curpos[2] - 1)
								local in_spell_capture = false
								for _, cap in ipairs(captures) do
									if cap.capture == "spell" then
										in_spell_capture = true
									elseif cap.capture == "nospell" then
										return false
									end
								end
								testee return in_spell_capture
							end, ]]
						},
					},

					--[[ 
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
					}, ]]
				},
			},
			fuzzy = {
				sorts = { "exact", "score", "sort_text" },
				--[[ 
				sorts = { function(a, b)
						local sort = require("blink.cmp.fuzzy.sort")
						if a.source_id == "spell" and b.source_id == "spell" then
							return sort.label(a, b)
						end
					end,
					-- This is the normal default order, which we fall back to
					"score",
					"kind",
					"label",
				}, ]]
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
}
