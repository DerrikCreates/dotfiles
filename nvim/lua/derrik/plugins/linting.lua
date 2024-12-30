return {

	"mfussenegger/nvim-lint",
	event = {
	"BufReadPre",
	"BufNewFile"
	},

	config = function()
	 local lint = require("lint")

	 lint.linter_by_ft = {

	
	 }
	end
}
