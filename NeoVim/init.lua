

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
},
{
"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
config = function()
local configs = require("nvim-treesitter.configs")

configs.setup({	
	ensure_installed = {"lua","vim","javascript","html","c_sharp"},
	sync_install = false,
	highlight = {enable = true},
	indent = {enable = true}

})

end
}

})

require("cyberdream").setup({

	transparent = true,
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


local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.verse = {
  install_info = {
    url = "P:/2_projects/2_software/tree-sitter-verse", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    --branch = "main", -- default branch in case of git repo if different from master
    --generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
  },
  filetype = "verse", -- if filetype does not match the parser name
}
