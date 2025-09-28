return{"nvim-treesitter/nvim-treesitter",

opts={
	auto_install = true,
	ensure_installed={
		"c_sharp",
		"razor",
		"css",
		"html",
		"lua",
		"typescript",
		"js",
	},
	highlight = {enable = true}

},

branch = 'main', lazy = false, build = ":TSUpdate"}
