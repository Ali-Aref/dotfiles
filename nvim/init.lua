-- init lazy.nvim
require("config.lazy")

require("config.lsp")
require("config.mapping")
require("config.opts")

-- colorscheme
vim.cmd.colorscheme("catppuccin-macchiato") -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- vim.cmd.colorscheme("poimandres")
