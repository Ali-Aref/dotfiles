return {
	"supermaven-inc/supermaven-nvim",
	-- lazy = true,
	-- cmd = { "SupermavenStart" },
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<A-i>",
				clear_suggestion = "<A-x>",
				accept_word = "<A-w>",
			},
			ignore_filetypes = { cpp = true }, -- or { "cpp", }
			color = {
				suggestion_color = "#485465",
				cterm = 244,
			},
			log_level = "info",             -- set to "off" to disable logging completely
			disable_inline_completion = false, -- disables inline completion for use with cmp
			disable_keymaps = false,        -- disables built in keymaps for more manual control
			condition = function()
				return false
			end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
		})
	end,
}
