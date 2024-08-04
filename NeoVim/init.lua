

	vim.g.mapleader = ' '
	vim.g.maplocalleader = ' '

	vim.opt.clipboard = 'unnamedplus'
vim.opt.updatetime = 250
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo-history"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
{
  'stevearc/oil.nvim',
    -- refer to the configuration section below
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
},

{
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
},

{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
	}
},

{
    'easymotion/vim-easymotion',
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>f', '<Plug>(easymotion-s)', {})
    end
},
{
	"romainl/vim-cool"
},

{
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
	
    dependencies = { 'nvim-lua/plenary.nvim' }
    }

})

require("cyberdream").setup({

	transparent = false,
	hide_fillchars = false,
	borderless_telescope = true,
	terminal_colors = true,

	extensions= {
	whichkey = true

	}

})
vim.cmd("colorscheme cyberdream")
require("oil").setup()
require("core.whichkey")


local buildint = require("telescope.builtin")

