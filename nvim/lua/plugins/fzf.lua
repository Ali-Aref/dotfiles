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
        height = 20,
        width = 60,
        relative = "cursor",
      }
    }

    -- mapping
    vim.keymap.set("n", "<leader>fa", function() fzf.global() end, { desc = "Global search" })
    vim.keymap.set("n", "<leader>ff", function() fzf.files() end, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fb", function () fzf.buffers(inline_opts) end, { desc = "Find buffer" })
    vim.keymap.set("n", "<leader>fw", function () fzf.live_grep_native() end, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fW", function () fzf.grep_cWORD() end, { desc = "Grep word" })
    -- lsp mappings
    vim.keymap.set("n", "<leader>fr", function () fzf.lsp_references() end, { desc = "LSP references" })
    vim.keymap.set("n", "<leader>fx", function () fzf.lsp_code_actions(inline_opts) end, { desc = "LSP code actions" })
    vim.keymap.set("n", "<leader>fd", function () fzf.lsp_document_diagnostics() end, { desc = "Document Diagnostics" })
    vim.keymap.set("n", "<leader>fD", function () fzf.lsp_workspace_diagnostics() end, { desc = "Workspace Diagnostics" })
    vim.keymap.set("n", "<leader>fs", function () fzf.lsp_document_symbols(inline_opts) end, { desc = "Document symbols" })
    vim.keymap.set("n", "<leader>fS", function () fzf.lsp_workspace_symbols(inline_opts) end, { desc = "Workspace symbols" })
    vim.keymap.set("n", "<leader>fi", function () fzf.lsp_incoming_calls() end, { desc = "LSP incoming calls" })
    vim.keymap.set("n", "<leader>fo", function () fzf.lsp_outgoing_calls() end, { desc = "LSP outgoing calls" })
    -- git
    vim.keymap.set("n", "<leader>fg", function () fzf.git_status() end, { desc = "Git status" })
    -- other
    vim.keymap.set("n", "<leader>fc", function () fzf.colorschemes() end, { desc = "Colorscheme" })
    vim.keymap.set("n", "<leader>fv", function () fzf.spell_suggest(inline_opts) end, { desc = "Spelling suggestions" })
    vim.keymap.set("n", "<leader>fl", function () fzf.resume() end, { desc = "Last command/query" })
    vim.keymap.set("n", "<leader>fm", function () fzf.marks() end, { desc = "Marks" })
    vim.keymap.set("n", "<leader>fK", function () fzf.keymaps() end, { desc = "Keymaps" })
  end,
}
