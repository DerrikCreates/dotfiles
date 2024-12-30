return{
 -- https://github.com/seblj/roslyn.nvim consider using this for c# instead of omnisharp
 "williamboman/mason.nvim",
 dependencies = {
	"williamboman/mason-lspconfig.nvim",
	"roslyn.nvim"
 },

 config = function()
 local mason = require("mason")
 local mason_lspconfig = require("mason-lspconfig")

 mason.setup({})

 mason_lspconfig.setup({
	 ensure_installed = {
	"lua_ls",
	"html",
	"omnisharp",
	},


	automatic_installation = true,

 })
 end

}
