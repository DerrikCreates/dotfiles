return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = { -- Your configuration comes here
		icons = { -- Define your custom icons here
			git = "",
			diff = "", -- Add more icons as neede
			group = "A",
		},

		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	config = function()
		local wk = require("which-key")
		wk.add({

			-- Which key groups
			{ "<leader>f", group = "File", icon = { icon = "", color = "orange" } },
			{ "<leader>b", group = "Buffer", icon = { icon = "", color = "blue" } },
			{ "<leader>l", group = "LSP", icon = { icon = "󰅩", color = "red" } },
			{ "<leader>ls", group = "Symbols", icon = { icon = "", color = "purple" } },
			{ "<leader>lc", group = "Calls", icon = { icon = "", color = "green" } },
		})
	end,
}
