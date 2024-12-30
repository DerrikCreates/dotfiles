return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = { -- Your configuration comes here
		icons = { -- Define your custom icons here
			git = "",
			diff = "", -- Add more icons as neede
			group = "A",
		},
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

	config = function()
		local wk = require("which-key")
		wk.add({

			{ "<leader>f", group = "File", icon = { icon = "", color = "orange" } },
			{ "<leader>b", group = "Buffer", icon = { icon = "", color = "blue" } },
		})
	end,
}
