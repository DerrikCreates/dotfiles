return {
	"mason-org/mason.nvim",
	opts = {

		registries = {
			"github:mason-org/mason-registry",
			"github:Crashdummyy/mason-registry",
		},

		ensure_installed = {
			"astyle",
			"csharpier",
			"stylua",
			"roslyn",
			"rzls",
			"lua-language-server",
			"netcoredbg",
		},
	},
}
