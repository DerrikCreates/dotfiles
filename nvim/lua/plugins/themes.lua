return{
    "tiagovla/tokyodark.nvim",
    opts = {
	styles = {
        comments = { italic = false}, -- style for comments
        keywords = { italic = false}, -- style for keywords
        identifiers = { italic = false}, -- style for identifiers
        functions = {}, -- style for functions
        variables = {}, -- style for variables
    },
    },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
        vim.cmd [[colorscheme tokyodark]]
    end,
}
