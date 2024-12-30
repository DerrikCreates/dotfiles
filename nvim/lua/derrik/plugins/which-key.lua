return{
"folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
},

config = function()
local wk = require("which-key")
wk.add({

	{"<leader>f",group = "file", icon= {icon="󱔐",color= "orange"}},
	{"<leader>fe",desc="file editor"},

})
end



}
