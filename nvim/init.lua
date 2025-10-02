-- in the off chance i point someone to my config, start here.
-- all that is happening is we are telling nvim to run the files below.
-- no special sauce this is just for organization, no reason the files below couldnt be one large file

-- i like how clean the structure of https://github.com/adibhanna/minimal-vim
require("config.settings")
require("core.lazy")
-- this is only for neovim lsp settings / enabling the lsp not configurating. configs are int he ./lsp folder
require("core.lsp")
-- plugins folder is imported already from core/lazy.lua