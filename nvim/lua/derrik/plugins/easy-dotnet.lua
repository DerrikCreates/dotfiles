return {

	"GustavEikaas/easy-dotnet.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "akinsho/toggleterm.nvim" },
	config = function()
		vim.keymap.set("n", "<leader>R", function()
			require("easy-dotnet").run_with_profile(true)
		end)

		vim.keymap.set("n", "<leader>ln", function()
			local path = MiniFiles.get_fs_entry().path
			if path == nil then
				return vim.notify("Cursor is not on valid entry")
			end
			-- TODO: figure out creating .net file tempaltes in minifiles
			vim.notify("path next line")
			vim.notify(path)
			MiniFiles.close()

			require("easy-dotnet").create_new_item(path)
		end, { desc = "Dotnet Create New File" })

		require("easy-dotnet").setup({
			auto_bootstrap_namespace = true,
			terminal = function(path, action, args)
				local commands = {
					run = function()
						return string.format("dotnet run --project %s %s", path, args)
					end,
					test = function()
						return string.format("dotnet test %s %s", path, args)
					end,
					restore = function()
						return string.format("dotnet restore %s %s", path, args)
					end,
					build = function()
						return string.format("dotnet build %s %s", path, args)
					end,
				}

				local command = commands[action]() .. "\r"
				require("toggleterm").exec(command, nil, nil, nil, "float")
			end,
		})

		vim.keymap.set("n", "<leader>bb", function()
			require("easy-dotnet").build_quickfix()
		end)
	end,
}
