return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					-- don't manually ignore files, so that you can find it using <leader>fa
					-- if they are not ignored, you should install ripgrep
					-- file_ignore_patterns = { "node_modules", "env", ".env", ".git" },

					-- Default configuration for telescope goes here:
					-- config_key = value,
					mappings = {
						n = {
							-- map actions.which_key to <C-h> (default: <C-/>)
							-- actions.which_key shows the mappings for your picker,
							-- e.g. git_{create, delete, ...}_branch for the git_branches picker
							["<C-h>"] = "which_key",
						},
					},
				},
				pickers = {
					find_files = {
						previewer = true,
						layout_strategy = "horizontal", -- horizontal, vertical, center
						layout_config = {
							width = 0.9,
							preview_width = 0.5
						},
					},
					buffers = {
						theme = "cursor",
						previewer = false,
						layout_config = {
							width = 0.5,
							preview_width = 0.3
						},
					},
					live_grep = { theme = "ivy" },
					grep_string = { theme = "ivy" },
					lsp_references = {
						layout_strategy = "vertical",
						show_line = false,
					},
					lsp_document_symbols = {
						theme = "cursor",
						previewer = true,
						layout_config = {
							width = 0.5,
							preview_width = 0.6,
						},
					},
					lsp_workspace_symbols = { theme = "ivy" },
					diagnostics = { theme = "ivy" },
					colorscheme = { enable_preview = true },
				},
				extensions = {
					-- Your extension configuration goes here:
					-- extension_name = {
					--   extension_config_key = value,
					-- }
					-- please take a look at the readme of the extension you want to configure
				},
			})

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>fa", builtin.git_files, { desc = "Find all files" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live grep " })
			vim.keymap.set("n", "<leader>fW", builtin.grep_string, { desc = "Grep string under cursor" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
			vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Choose color scheme" })
			-- lsp features
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find LSP reference from under cursor" })
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find LSP document symbols" })
			vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Find LSP workspace symbols" })
			vim.keymap.set("n", "<leader>fd", function()
				builtin.diagnostics({ bufnr = 0 })
			end, { desc = "Find diagnostics for current buffer" })
			vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "Find diagnostics for all buffers" })
		end,
	},
	-- telescope ui for quick actions
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown({}) },
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
