return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup({
			delve = {
				initialize_timeout_sec = 20,
				port = "${port}",
			},
		})

		local dap = require("dap")

		dap.configurations.go = {
			{
				type = "go",
				name = "Debug test (current file)",
				request = "launch",
				mode = "test",
				program = "${fileDirname}",
			},
		}
	end,
}
