return {
	{
		"tiagovla/tokyodark.nvim",
		enabled = false,
		opts = {
			styles = {
				comments = { italic = false }, -- style for comments
				keywords = { italic = false }, -- style for keywords
				identifiers = { italic = false }, -- style for identifiers
				functions = {}, -- style for functions
				variables = {}, -- style for variables
			},
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			vim.cmd([[colorscheme tokyodark]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
		config = function()
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
		opts = {
			flavor = "mocha",
		},
	},
	{
		"scottmckendry/cyberdream.nvim",
		enabled = true,
		opts= {},
		config = function()
			require("cyberdream").setup(opts)
			vim.cmd.colorscheme("cyberdream")
		end
	}
}
