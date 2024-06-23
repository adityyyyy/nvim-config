return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()
			require("nvim-dap-virtual-text").setup({
				enabled = true,
			})

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<Leader>bp", dap.toggle_breakpoint, { desc = "toggle_breakpoint" })
			vim.keymap.set("n", "<Leader>cc", dap.continue, { desc = "continue" })
			vim.keymap.set("n", "<Leader>sob", dap.step_over, { desc = "step over" })
			vim.keymap.set("n", "<Leader>sib", dap.step_into, { desc = "step into" })
			vim.keymap.set("n", "<Leader>sOb", dap.step_out, { desc = "step out" })
		end,
	},
}
