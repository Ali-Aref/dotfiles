return {
  "folke/persistence.nvim",
  event = "VimEnter",
  opts = {},
  config = function(_, opts)
    require("persistence").setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistenceLoadPost",
      group = vim.api.nvim_create_augroup("persistence_restore_buffers", { clear = true }),
      callback = function()
        vim.schedule(function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "" and vim.api.nvim_buf_get_name(buf) ~= "" then
              vim.api.nvim_buf_call(buf, function()
                if vim.bo.filetype == "" then
                  vim.cmd("filetype detect")
                end

                vim.api.nvim_exec_autocmds("BufReadPost", { buffer = buf, modeline = false })
                vim.api.nvim_exec_autocmds("FileType", { buffer = buf, modeline = false })
                vim.api.nvim_exec_autocmds("BufEnter", { buffer = buf, modeline = false })
              end)
            end
          end
        end)
      end,
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("persistence_auto_restore", { clear = true }),
      callback = function()
        local ignored_filetypes = {
          gitcommit = true,
          gitrebase = true,
        }

        if vim.fn.argc() > 0 or vim.g.started_with_stdin == 1 then
          return
        end

        if ignored_filetypes[vim.bo.filetype] or vim.bo.buftype ~= "" then
          return
        end

        require("persistence").load()
      end,
    })

    vim.keymap.set("n", "<leader>qs", function()
      require("persistence").load()
    end, { desc = "Restore session for current directory" })

    vim.keymap.set("n", "<leader>ql", function()
      require("persistence").load { last = true }
    end, { desc = "Restore last session" })

    vim.keymap.set("n", "<leader>qd", function()
      require("persistence").stop()
    end, { desc = "Stop saving session" })
  end,
}
