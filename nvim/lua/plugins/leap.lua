return {
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)", { desc = "Leap forward/backward" })
			vim.keymap.set("n", "S", "<Plug>(leap-from-window)", { desc = "Leap from window" })
		end,
	},
}
