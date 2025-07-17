return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "TodoQuickFix", "TodoLocList" },
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
			SERVER = { icon = " ", color = "api", alt = { "BACKEND", "API" } },
		},
		colors = {
			info = { "#25afff" },
			warning = { "#fc8f59" },
			error = { "#ff5050" },
			test = { "#D03259" },
			ref = { "#7084c6" },
			hint = { "#10B981" },
			clean = { "#6b7280" },
      api = { "#C792EA" },
		},
	},
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>ta", "<cmd>TodoQuickFix<cr>" , desc = "Todo Notes" },
    { "<leader>tn", "<cmd>TodoQuickFix keywords=NOTE,HACK,PREF,START<cr>" , desc = "Todo Notes/Hack/Pref" },
    { "<leader>ts", "<cmd>TodoQuickFix keywords=SERVER,BACKEND,API<cr>" , desc = "Todo API/Server/Backend" },
    { "<leader>tf", "<cmd>TodoQuickFix keywords=FIX,FIXME,BUG,FIXIT,ISSUE<cr>" , desc = "Todo Fix/Bug/Issue" },
  }
}
