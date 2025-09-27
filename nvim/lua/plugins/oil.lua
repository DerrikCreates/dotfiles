return{
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = 
  {
  },

  config = function()
    vim.keymap.set("n","<leader>f","<cmd>Oil<cr>")

    require("oil").setup(opts)
  end,
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}
