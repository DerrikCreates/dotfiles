return {
	--https://www.youtube.com/watch?v=NL8D8EkphUw&t
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},

	config = function()
		local cmp = require("cmp")
		local ls = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		for test = 1, 10 do
		end
		vim.keymap.set({ "i", "s" }, "<F2>", function()
			ls.jump(1)
		end, { silent = true, desc = "snippen next", remap = false })

		vim.keymap.set({ "i", "s" }, "<F1>", function()
			ls.jump(-1)
		end, { silent = true, desc = "snippet prev", remap = false })

		cmp.setup({

			--	compleation = { completeopt = "menu,menuone,preview,noselect" },
			--snippet = {
			--		expand = function()
			--			ls.lsp_expand(args.body)
			--		end,
			--	},
			mapping = cmp.mapping.preset.insert({

				["<A-j>"] = cmp.mapping.scroll_docs(-4),
				["<A-k>"] = cmp.mapping.scroll_docs(4),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-J>"] = cmp.mapping.select_next_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				--{ name = "buffer" },
				--{ name = "path" },
			}),

			window = {
				completion = cmp.config.window.bordered({
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
				}),
				-- documentation = cmp.config.window.bordered(borderstyle),
				documentation = cmp.config.window.bordered({
					-- border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }, -- more explicit border characters
					-- border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
					border = "rounded", -- more explicit border characters
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
					-- winhighlight = 'Normal:Normal,FloatBorder:Error',
				}),
				-- completion = {
				--     border = "rounded",
				--     winhighlight = "Normal:CmpNormal",
				-- },
				-- documentation = {
				--     border = "rounded",
				--     winhighlight = "Normal:CmpDocumentationNormal,FloatBorder:Pmenu",
				--     -- winhighlight = "FloatBorder:CmpBorder",
				-- }
			},
		})
	end,
}
