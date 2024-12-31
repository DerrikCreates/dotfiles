return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local tele = require("telescope")
		local actions = require("telescope.actions")

		tele.setup({


		defaults = {
			path_display = {"smart"},
			}
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set('n',"<leader>ff",builtin.find_files,{desc= "Telescope Find Files"})

		vim.keymap.set('n',"<leader>fs",builtin.live_grep,{desc= "Telescope Find String (grep)"})


	end,
}
