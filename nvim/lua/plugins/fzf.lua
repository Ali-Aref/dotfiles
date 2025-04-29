return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    local fzf = require("fzf-lua")
    local config = fzf.config
    local actions = config.actions
    fzf.setup({})

    local inline_opts = {
      winopts = {
        height = 20, -- value of 0 - 1 will be treated as percentage
        width = 60, -- value of 0 - 1 will be treated as percentage
        relative = "cursor",
      }
    }

    -- mapping
    vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>", { desc = "Find files" })
    vim.keymap.set("n", "<leader>fb", function () fzf.buffers(inline_opts) end, { desc = "Find buffer" })
    vim.keymap.set("n", "<leader>fw", ":FzfLua live_grep_native<CR>", { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fW", ":FzfLua grep_cWORD<CR>", { desc = "Grep word" })
    -- lsp mappings
    vim.keymap.set("n", "<leader>fr", ":FzfLua lsp_references<CR>", { desc = "LSP references" })
    vim.keymap.set("n", "<leader>fa", function () fzf.lsp_code_actions(inline_opts) end, { desc = "LSP code actions" })
    vim.keymap.set("n", "<leader>fd", ":FzfLua lsp_document_diagnostics<CR>", { desc = "Document Diagnostics" })
    vim.keymap.set("n", "<leader>fD", ":FzfLua lsp_workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
    vim.keymap.set("n", "<leader>fs", function () fzf.lsp_document_symbols(inline_opts) end, { desc = "Document symbols" })
    vim.keymap.set("n", "<leader>fS", ":FzfLua lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })
    vim.keymap.set("n", "<leader>fi", ":FzfLua lsp_incoming_calls<CR>", { desc = "LSP incoming calls" })
    vim.keymap.set("n", "<leader>fo", ":FzfLua lsp_outgoing_calls<CR>", { desc = "LSP outgoing calls" })
    -- git
    vim.keymap.set("n", "<leader>fg", ":FzfLua git_status<CR>", { desc = "LSP outgoing calls" })
    -- other
    vim.keymap.set("n", "<leader>fc", ":FzfLua colorschemes<CR>", { desc = "Colorscheme" })
    vim.keymap.set("n", "<leader>fv", function () fzf.spell_suggest(inline_opts) end, { desc = "Spelling suggestions" })
    vim.keymap.set("n", "<leader>fl", ":FzfLua resume<CR>", { desc = "Last command/query" })
    vim.keymap.set("n", "<leader>fm", ":FzfLua marks<CR>", { desc = "Marks" })
    vim.keymap.set("n", "<leader>fK", ":FzfLua keymaps<CR>", { desc = "Keymaps" })
  end,
}
