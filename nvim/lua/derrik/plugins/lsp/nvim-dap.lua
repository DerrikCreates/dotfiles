return {

	"mfussenegger/nvim-dap",
	dependencies = { { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } } },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		-- doesnt need to be explicit on the path? lsp did it so idk
		require("derrik.plugins.lsp.dap-config.dotnet").register_net_dap()

		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })

		vim.keymap.set("n", "<leader>dq", function()
			dap.close()
			dapui.close()
		end, { desc = "Close" })

		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
		vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
		vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "dap.repl.toggle" })
		vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Dap Down" })
		vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Dap UP" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Breakpoint" })

		vim.keymap.set("n", "<leader>dh", require("dap.ui.widgets").hover, { desc = "UI Widgets Hover" })

		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "DapBreakpoint", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "󰳟", texthl = "", linehl = "DapStopped", numhl = "" })

		dapui.setup({})
	end,
}
