return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble", "TodoTelescope" },
	opts = {
		keywords = {
			FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
			WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
			HACK = { icon = "", color = "warning" },
			TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			PERF = { icon = "", color = "ref", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			TODO = { icon = "", color = "info" },
			NOTE = { icon = "", color = "hint", alt = { "INFO", "START" } },
			CLEAN = { icon = "󰆳", color = "clean", alt = { "CLEANUP", "REMOVE" } },
			API = { icon = " ", color = "test", alt = { "BACKEND", "SERVER" } },
		},
		colors = {
			info = { "#25afff" },
			warning = { "#fc8f59" },
			error = { "#ff5050" },
			test = { "#D03259" },
			ref = { "#7084c6" },
			hint = { "#10B981" },
			clean = { "#6b7280" },
		},
	},
	config = function()
		-- todo quick fix
		require("todo-comments").setup()
		vim.keymap.set("n", "<leader>qf", "<cmd>TodoQuickFix<CR>", { desc = "Toggle todo quick fix" })
		vim.keymap.set(
			"n",
			"<leader>ft", "<cmd>TodoTelescope theme=ivy initial_mode=insert previewer=true layout_config={bottom_pane={height=12}}<CR>",
			{ desc = "Find Todos" }
		)
	end,
}
