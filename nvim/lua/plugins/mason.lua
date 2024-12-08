return {
	-- mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	-- mason-lsp-config
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",     -- actual lsp
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})
		end,
	}
}
