-- jj to esc
vim.keymap.set("i", "jj", "<esc>")
-- vim.keymap.set("t", 'jj', [[<C-\><C-n>]], { noremap = true, silent = true })

-- navigation when in normal mode with wrap lines
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move down" })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move up" })

-- map noh to esc
vim.keymap.set("n", "<esc>", "<cmd>:noh<CR>")
vim.keymap.set("t", "jj", "<C-\\><C-n>", { noremap = true, silent = true })

-- kill current buffer
vim.keymap.set("n", "<leader>x", "<cmd>bprev<CR><cmd>bd!#<CR>", { desc = "Close buffer" })

-- toggle spell checking
vim.keymap.set("n", "gS", "<cmd>setlocal spell!<cr>", { desc = "Toggle spell checking" })

-- -- navigate to next/pervious
-- vim.keymap.set("n", "<Tab>", "<C-w><C-w>", { desc = "Move left" })
-- vim.keymap.set("n", "<S-Tab>", "<C-w><C-W>", { desc = "Move left" })

-- navigate to panes
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down" })

-- resize panes
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -10<CR>", { desc = "Shrink pane vertically" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +10<CR>", { desc = "Gorw pane vertically" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize +5<CR>", { desc = "Grow pane horizontally" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize -5<CR>", { desc = "Shrink pane horizontally" })

-- bufferline
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Switch to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Switch to previous buffer" })

-- toggle line numbers
vim.keymap.set("n", "<leader>n", function()
	local number_enabled = vim.o.number
	local relativenumber_enabled = vim.o.relativenumber
	if number_enabled or relativenumber_enabled then
		vim.cmd("set norelativenumber")
		vim.cmd("set nonumber")
	else
		vim.cmd("set relativenumber")
		vim.cmd("set number")
	end
end, { desc = "Toggle line numbers" })

