return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local floating_window_width = 100
		local floating_window_height = 30

		require("nvim-tree").setup({
			update_focused_file = { enable = true },
			view = {
				width = 30,
				side = "left", -- left, right
				float = {
					enable = false, -- floating
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = floating_window_width,
						height = floating_window_height,
						row = math.floor((vim.o.lines - floating_window_height) / 2),
						col = math.floor((vim.o.columns - floating_window_width) / 2),
					},
				},
			},
		})
		-- nvim tree
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Files" })
	end,
}

