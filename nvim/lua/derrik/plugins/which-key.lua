return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = { -- Your configuration comes here
		icons = { -- Define your custom icons here
			git = "",
			diff = "", -- Add more icons as neede
			group = "A",
		},

		keys = {},
	},

	config = function()
		local wk = require("which-key")
		wk.add({
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
			-- Which key groups
			{ "<leader>f", group = "File", icon = { icon = "", color = "orange" } },
			{ "<leader>b", group = "Buffer", icon = { icon = "", color = "blue" } },
			{ "<leader>l", group = "LSP", icon = { icon = "󰅩", color = "red" } },
			{ "<leader>ls", group = "Symbols", icon = { icon = "", color = "purple" } },
			{ "<leader>lc", group = "Calls", icon = { icon = "", color = "green" } },
			{ "<leader>le", group = "Edit", icon = { icon = "", color = "green" } },
			{ "<leader>s", group = "Show", icon = { icon = "󰈈", color = "orange" } },
			{ "<leader>g", group = "Go To", icon = { icon = "󰎐", color = "orange" } },
			{ "<leader>c", group = "Code Actions", icon = { icon = "", color = "orange" } },

			{ "<leader>S", group = "Select", icon = { icon = "󰒅", color = "white" } },
			{ "<leader>d", group = "Debug", icon = { icon = "", color = "white" } },

		})
	end,
}
