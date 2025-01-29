return {
	"numToStr/FTerm.nvim",
	-- lazy = true,
	config = function()
		local fterm = require("FTerm")
		fterm.setup({
			dimensions = {
				height = 0.6,
				width = 0.6,
				-- x = 0.5,
				-- y = 0.5,
			},
		})

		local runners = { lua = "lua", javascript = "node", python = "python" }

		local lazygit = fterm:new({
			cmd = "lazygit",
			dimensions = { height = 0.9, width = 0.9 },
		})
		local posting = fterm:new({
			cmd = "posting --collection collection --env .env",
			dimensions = { height = 0.9, width = 0.9 },
		})
		local taskell = fterm:new({
			cmd = "taskell todo.md",
			dimensions = { height = 0.5, width = 1, x = 0, y = 1 },
		})
		local bottomTerm = fterm:new({
			dimensions = { height = 0.4, width = 1, x = 0, y = 1 },
		})
		local btop = fterm:new({
			cmd = "btop",
			dimensions = { height = 0.8, width = 0.8 },
		})

		-- floating
		vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle terminal" })
		vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle terminal" })
		-- lgTerm
		vim.keymap.set("n", "<A-B>", function() btop:toggle() end, { desc = "Toggle btop" })
		vim.keymap.set("t", "<A-B>", function() btop:toggle() end, { desc = "Toggle btop" })
		-- lazygit
		vim.keymap.set("n", "<A-g>", function() lazygit:toggle() end, { desc = "lazygit" })
		vim.keymap.set("t", "<A-g>", function() lazygit:toggle() end, { desc = "Toggle lazygit" })
		-- taskell
		vim.keymap.set("n", "<A-t>", function() taskell:toggle() end, { desc = "Taskell" })
		vim.keymap.set("t", "<A-t>", function() taskell:toggle() end, { desc = "Toggle Taskell" })
		-- posting
		vim.keymap.set("n", "<A-p>", function() posting:toggle() end, { desc = "posting" })
		vim.keymap.set("t", "<A-p>", function() posting:toggle() end, { desc = "Toggle Posting" })
		-- bottom terminal
		vim.keymap.set("n", "<A-\\>", function() bottomTerm:toggle() end, { desc = "Toggle bottom terminal" })
		vim.keymap.set("t", "<A-\\>", function() bottomTerm:toggle() end, { desc = "Toggle bottom terminal" })
		-- run
		vim.keymap.set("n", "<A-r>", function()
			local buf = vim.api.nvim_buf_get_name(0)
			local ftype = vim.filetype.match({ filename = buf })
			local exec = runners[ftype]
			if exec ~= nil then
				require("FTerm").scratch({
					cmd = { exec, buf },
					dimensions = { height = 0.3, width = 1, x = 0, y = 1 }
				})
			end
		end, { desc = "Run file" })
	end,
}
