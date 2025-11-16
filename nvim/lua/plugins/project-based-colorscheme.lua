return {
	"ali-aref/project-based-colorscheme.nvim",
	config = function()
		require("project-based-colorscheme").setup({
			default_colorscheme = "catppuccin-mocha", -- Your default colorscheme
		})
	end,
}
