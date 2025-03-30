return{

	"easymotion/vim-easymotion",

	config = function()
		vim.g.EasyMotion_smartcase = 1
		vim.keymap.set({"n", "v"}, "<leader><leader>", "<Plug>(easymotion-s2)", { desc = "Easy Motion" })
	end
}
