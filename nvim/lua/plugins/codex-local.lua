return {
  {
    dir = "/home/ali/Projects/other/codex.nvim",
    name = "codex.nvim",
    keys = {
      {
        "<A-e>",
        function()
          require("codex").toggle()
        end,
        mode = { "n", "t" },
        desc = "Codex: toggle terminal",
      },
      {
        "ge",
        "<Cmd>lua require('codex').send_selection()<CR>",
        mode = "x",
        desc = "Codex: send visual selection",
      },
    },
    config = function()
      require("codex").setup({
        split = "vertical", -- "horizontal" | "vertical"
        size = 0.3,
        codex_cmd = { "codex" },
        focus_after_send = false,
        escape_codex = "jj", -- optional: Terminal-mode lhs to send <C-\><C-n> (omit to disable)
      })
    end,
  },
}