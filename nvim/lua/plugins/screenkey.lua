return {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*", -- or branch = "main", to use the latest commit
    opts= {
	win_opts = {width = 25},
    },

    config = function()

	   sk = require("screenkey")
	   sk.setup(opts)
	   sk.toggle()
	    
    end
    }
