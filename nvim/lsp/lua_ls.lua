return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},

	workspace = {
		library = vim.env.VIMRUNTIME,
		checkThirdParty = false, -- Optional: disables prompts about third-party libraries
	},
	diagnostics = {
		globals = { "vim" },
	},
}
