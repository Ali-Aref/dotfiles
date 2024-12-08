return {
	"nvim-pack/nvim-spectre",
	lazy = true,
	cmd = { "Spectre" },
	config = function()
		require("spectre").setup({
			is_block_ui_break = true,
		})
		-- mapping
		vim.keymap.set("n", "<leader>fgs", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
		vim.keymap.set(
			"n",
			"<leader>fgw",
			'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
			{ desc = "Search current word" }
		)
	end,
}
