return
{
'echasnovski/mini.files',
version = false,

  config = function()
		local files = require("mini.files")
		
		vim.keymap.set("n","<leader>fe",":lua MiniFiles.open()<cr>",{desc = "File System Editor",noremap = true,silent =true})
			
  		files.setup({ 
			
			options = {
			
			},

mappings = {
				go_in_plus = '<cr>',

			}

	})
  end,

}
