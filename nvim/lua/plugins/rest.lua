return {
	"rest-nvim/rest.nvim",
	rocks = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "http")
			-- opts.ensure_installed = { "lua", "http", "json" }
		end,
	},
	config = function()
		local rest_nvim = require("rest-nvim")
		rest_nvim.setup({
			response = {
				hooks = {
					format = true,
					decode_url = true,
				},
			},
		})
		-- keybindings
		vim.keymap.set("n", "<leader>rr", "<cmd>:Rest run<cr>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>rl", "<cmd>:Rest last<cr>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>rv", "<cmd>:Rest env show<cr>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>rs", "<cmd>:Rest env select<cr>", { noremap = true, silent = true })
	end,
}
