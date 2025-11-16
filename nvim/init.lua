-- init lazy.nvim
require("config.lazy")

require("config.lsp")
require("config.mapping")
require("config.opts")

-- colorscheme
-- vim.cmd.colorscheme("catppuccin-mocha") -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- vim.cmd.colorscheme("nordic")
-- gruvbox-material

-- Project-specific colorscheme setup
-- This will be configured via lazy.nvim plugin manager after moving the plugin
-- require("project-based-colorscheme").setup({
--   default_colorscheme = "catppuccin-mocha",
-- })
