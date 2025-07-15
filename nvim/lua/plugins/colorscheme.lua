return {
	{
		-- catppuccin
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- auto, latte, frappe, macchiato, mocha
				background = { -- :h background
					-- light = "latte",
					-- dark = "mocha",
				},
				transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
				term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = { "italic" },
					booleans = { "bold", "italic" },
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {},
				custom_highlights = {},
				highlight_overrides = {
					macchiato = function(macchiato)
						return {
							LineNr = { fg = macchiato.surface2 },
						}
					end,
				},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = false,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
		end,
	},
	{
		-- gruvbox-material
		"sainnhe/gruvbox-material",
		priority = 1000,
		config = function()
			-- Set up configuration options
			vim.g.gruvbox_material_background = "hard" -- soft, medium, hard
			vim.g.gruvbox_material_foreground = "material" -- material, mix, original
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_transparent_background = 2 -- 2 for full transparency
			vim.g.gruvbox_material_sign_column_background = "none"
			vim.g.gruvbox_material_diagnostic_text_highlight = 1
			vim.g.gruvbox_material_diagnostic_line_highlight = 1
			vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
			-- vim.g.gruvbox_material_cursor = "orange" -- `'auto'`, `'red'`, `'orange'`, `'yellow'`, `'green', 'aqua'`, `'blue'`, `'purple'`
      vim.g.gruvbox_material_show_eob = 1 -- 1 for show end of buffer

			-- Remove window split borders
			vim.g.gruvbox_material_ui_contrast = "high"
			vim.g.gruvbox_material_float_style = "dim"

			-- Custom highlights to remove borders
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "gruvbox-material",
				callback = function()
					-- Remove split borders
					vim.cmd([[highlight WinSeparator guifg=none guibg=none]])
					-- Remove completion menu borders
					vim.cmd([[highlight Pmenu guibg=none]])
					vim.cmd([[highlight PmenuSel guibg=#504945]])
					vim.cmd([[highlight PmenuSbar guibg=none]])
					vim.cmd([[highlight PmenuThumb guibg=#504945]])
					-- Remove floating window borders
					vim.cmd([[highlight NormalFloat guibg=none]])
					vim.cmd([[highlight FloatBorder guifg=none guibg=none]])
					-- Remove terminal borders
					vim.cmd([[highlight TerminalBorder guifg=none guibg=none]])
				end,
			})
		end,
	},
}

