-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<leader>bF", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
		-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts) -- default to grr
		-- vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts) -- default to grn
	end,
})

-- language servers
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable file operations for automatic import updates when renaming files
capabilities.workspace = capabilities.workspace or {}
capabilities.workspace.fileOperations = {
	didRename = true,
	willRename = true,
}

-- lua_ls
vim.lsp.config("lua_ls", {})

-- tsserver
vim.lsp.config("ts_ls", {})

-- eslint-ls
vim.lsp.config("eslint", {
	root_markers = { ".eslintrc", ".eslintrc.json", ".eslintrc.js", "package.json", ".git" },
  -- Only enable if one of the markers (other than .git) exists
  condition = function(root_dir)
      return vim.fs.root(root_dir, { ".eslintrc", ".eslintrc.json", ".eslintrc.js", "package.json" }) ~= nil
  end,
})

-- jsonls
vim.lsp.config("jsonls", {})

-- tailwindcss
vim.lsp.config("tailwindcss", {
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "class:list", "classList", "ngClass", "style" },
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			validate = true,
			-- for twrnc react-native
			experimental = {
				classRegex = {
					"tw`([^`]*)",
					{ "tw.style%(([^)]*)%)", "'([^']*)'" },
				},
			},
		},
	},
})

-- pylsp
vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				-- pyflakes = { enabled = true },
				-- pycodestyle = { enabled = true },
				-- mccabe = { enabled = true },
				pylint = { enabled = true }, -- optional
				-- flake8 = { enabled = false }, -- optional
				-- yapf = { enabled = false }, -- formatter, disable if using black
				-- autopep8 = { enabled = false },
				-- pylsp_mypy = { enabled = false }, -- can be enabled for type-checking
				-- jedi_completion = { enabled = true },
				-- jedi_hover = { enabled = true },
				-- jedi_references = { enabled = true },
			},
		},
	},
})

-- clang
vim.lsp.config("clangd", {})

vim.lsp.config("emmet_language_server", {
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"pug",
		"typescriptreact",
	},
	-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
	-- **Note:** only the options listed in the table are supported.
	init_options = {
		---@type table<string, string>
		includeLanguages = {},
		--- @type string[]
		excludeLanguages = {},
		--- @type string[]
		extensionsPath = {},
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
		preferences = {},
		--- @type boolean Defaults to `true`
		showAbbreviationSuggestions = true,
		--- @type "always" | "never" Defaults to `"always"`
		showExpandedAbbreviation = "always",
		--- @type boolean Defaults to `false`
		showSuggestionsAsSnippets = false,
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
		syntaxProfiles = {},
		--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
		variables = {},
	},
})

-- kotlin lsp
vim.lsp.config("kotlin_language_server", {
	cmd = { "kotlin-language-server" },
	init_options = {
		storagePath = "/home/ali/.cache/kotlin-language-server",
	},
	filetypes = { "kotlin" },
	root_markers = {
		".git",
		"pom.xml",
		"build.xml",
		"build.gradle",
		"settings.gradle",
		"build.gradle.kts",
		"settings.gradle.kts"
	},
})

-- global lsp config
vim.lsp.config("*", {
  capabilities = capabilities,
})


vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"eslint",
	"jsonls",
	"tailwindcss",
	"pylsp",
	"clangd",
	"emmet_language_server",
	"kotlin_language_server",
})
