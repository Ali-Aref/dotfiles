return {
	"numToStr/FTerm.nvim",
	event = "VeryLazy",
	opts = {
		dimensions = {
			height = 0.8,
			width = 0.8,
		},
	},
	config = function()
		local fterm = require("FTerm")

    -- Code Runner - execute commands in a floating terminal
    local runners = {
      lua = 'lua',
      javascript = 'node',
      python = 'python',
    }


		local lazyGit = fterm:new({
			cmd = "lazygit",
			dimensions = {
				height = 0.9,
				width = 0.9,
        x = 0.5,
        y = 0.5,
			},
		})
		local btop = fterm:new({
			cmd = "btop",
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		})
		local bterm = fterm:new({
			dimensions = {
				height = 0.4,
				width = 1,
        x = 0.5,
        y = 1,
			},
		})

		-- keybindings
    vim.keymap.set('n', '<A-r>', function()
        local buf = vim.api.nvim_buf_get_name(0)
        local ftype = vim.filetype.match({ filename = buf })
        local exec = runners[ftype]
        if exec ~= nil then
            fterm.scratch({
              cmd = { exec, buf },
              dimensions = {
                height = 0.4,
                width = 1,
                x = 0.5,
                y = 1,
              }
            })
        end
    end)

		vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
		-- lazygit
		vim.keymap.set("n", "<A-g>", function() lazyGit:toggle() end, { desc = "Lazygit" })
		vim.keymap.set("t", "<A-g>", function() lazyGit:toggle() end, { desc = "Lazygit" })
    -- btop
		vim.keymap.set("n", "<A-B>", function() btop:toggle() end, { desc = "BTop" })
		vim.keymap.set("t", "<A-B>", function() btop:toggle() end, { desc = "BTop" })
    -- bottom term
		vim.keymap.set("n", "<A-b>", function() bterm:toggle() end, { desc = "Bottom Term" })
		vim.keymap.set("t", "<A-b>", function() bterm:toggle() end, { desc = "Bottom Term" })
	end,
}
