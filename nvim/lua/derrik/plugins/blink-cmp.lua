return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },

	version = "*",

	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		signature = { enabled = true },
		keymap = {
			preset = "enter",
			["<C-J>"] = { "select_next", "fallback" },
			["<C-K>"] = { "select_prev", "fallback" },
			["<C-Space>"] = {"show"},

			cmdline = { preset = "super-tab" },
		},

		appearance = {

			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "luasnip", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
