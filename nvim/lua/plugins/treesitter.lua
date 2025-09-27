return{"nvim-treesitter/nvim-treesitter",

opts={

	ensure_installed={
		"c_sharp",
		"razor",
		"css",
		"html",
		"lua",
		"typescript",
		"js",
	}

},

branch = 'master', lazy = false, build = ":TSUpdate"}
