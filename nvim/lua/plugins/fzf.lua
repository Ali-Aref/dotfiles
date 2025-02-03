return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    local fzf = require("fzf-lua")
    local config = fzf.config
    local actions = config.actions
    fzf.setup({})
    -- mapping
    vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>", { desc = "Find files" })
    vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>", { desc = "Find buffer" })
    vim.keymap.set("n", "<leader>fw", ":FzfLua live_grep_native<CR>", { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fW", ":FzfLua grep_cWORD<CR>", { desc = "Grep word" })
    -- lsp mappings
    vim.keymap.set("n", "<leader>fr", ":FzfLua lsp_references<CR>", { desc = "LSP references" })
    vim.keymap.set("n", "<leader>fa", ":FzfLua lsp_code_actions<CR>", { desc = "LSP code actions" })
    vim.keymap.set("n", "<leader>fd", ":FzfLua lsp_document_diagnostics<CR>", { desc = "Document Diagnostics" })
    vim.keymap.set("n", "<leader>fD", ":FzfLua lsp_workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
    vim.keymap.set("n", "<leader>fs", ":FzfLua lsp_document_symbols<CR>", { desc = "Document symbols" })
    vim.keymap.set("n", "<leader>fS", ":FzfLua lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })
    vim.keymap.set("n", "<leader>fi", ":FzfLua lsp_incoming_calls<CR>", { desc = "LSP incoming calls" })
    vim.keymap.set("n", "<leader>fo", ":FzfLua lsp_outgoing_calls<CR>", { desc = "LSP outgoing calls" })
    -- git
    vim.keymap.set("n", "<leader>fg", ":FzfLua git_status<CR>", { desc = "LSP outgoing calls" })
    -- other
    vim.keymap.set("n", "<leader>fc", ":FzfLua colorschemes<CR>", { desc = "Find colorscheme" })
    vim.keymap.set("n", "<leader>fC", ":FzfLua awesome_colorschemes<CR>", { desc = "Find colorscheme" })
    vim.keymap.set("n", "<leader>fv", ":FzfLua spell_suggest<CR>", { desc = "Spelling suggestions" })
    vim.keymap.set("n", "<leader>fl", ":FzfLua resume<CR>", { desc = "Last command/query" })
    vim.keymap.set("n", "<leader>fm", ":FzfLua marks<CR>", { desc = "Last command/query" })
  end,
}
