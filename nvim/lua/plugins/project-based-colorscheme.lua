return {
	"ali-aref/project-based-colorscheme.nvim",
	config = function()
		require("project-based-colorscheme").setup({
			default_colorscheme = "gruvbox-material", -- default colorscheme
		})
	end,
}

-- "gruvbox-material"
-- "nordic"
-- "catppuccin"
-- "catppuccin-macchiato"
