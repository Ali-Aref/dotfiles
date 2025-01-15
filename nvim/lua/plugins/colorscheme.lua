return {
	{
		-- gruvbox
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = false,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = false, -- invert background for search, diffs, statuslines and errors
				contrast = "soft", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {
					SpellBad = { undercurl = true, sp = "#ff0000" }, -- underline miss-spelled words
					-- -- remove borders
					-- Normal = { bg = "#282828" },
					-- VertSplit = { bg = "#282828", fg = "#282828" },
					-- StatusLine = { bg = "#282828", fg = "#282828" },
					-- StatusLineNC = { bg = "#282828", fg = "#282828" },
					-- WinSeparator = { bg = "#282828", fg = "#282828" },
				},
				dim_inactive = false,
				transparent_mode = true,
			})
		end,
	},
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
			-- setup must be called before loading
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		-- onedark
		"navarasu/onedark.nvim",
		config = function()
			local onedark = require("onedark")
			onedark.setup({
				style = "warm", -- dark, darker, cool, deep, warm, warmer, light
				transparent = true, -- Show/hide background
				term_colors = true, -- Change terminal color as per the selected theme style
				ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
				cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

				-- toggle theme style ---
				-- toggle_style_key = '<leader>cv', -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

				-- Change code style ---
				-- Options are italic, bold, underline, none
				-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
				code_style = {
					comments = "italic",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},

				-- Lualine options --
				lualine = {
					transparent = true, -- lualine center bar transparency
				},

				-- Custom Highlights --
				colors = {}, -- Override default colors
				highlights = {
					NormalFloat = { bg = "none", fg = "$blue" },
					FloatBorder = { bg = "none", fg = "$blue" },
					LazyNormal = { bg = "none", fg = "$blue" },
					MasonNormal = { bg = "none", fg = "$blue" },
				}, -- Override highlight groups

				-- Plugins Config --
				diagnostics = {
					darker = true, -- darker colors for diagnostic
					undercurl = true, -- use undercurl instead of underline for diagnostics
					background = true, -- use background color for virtual text
				},
			})
			onedark.load()
		end,
	},
	-- bioandres
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				bold_vert_split = false, -- use bold vertical separators
				dim_nc_background = false, -- dim 'non-current' window backgrounds
				disable_background = false, -- disable background
				disable_float_background = true, -- disable background for floats
				disable_italics = false, -- disable italics
			})
		end,

		-- optionally set the colorscheme within lazy config
		init = function()
			vim.cmd("colorscheme poimandres")
		end,
	},
}
