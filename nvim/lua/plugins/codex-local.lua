return {
  {
    dir = "/home/ali/Projects/etc/codex.nvim",
    name = "ai-nvim",
    keys = {
      {
        "<A-e>",
        function()
          require("codex").toggle()
        end,
        mode = { "n", "t" },
        desc = "AI Nvim: toggle terminal",
      },
      {
        "<leader>aa",
        function()
          require("codex").pick_provider()
        end,
        mode = "n",
        desc = "AI CLI: pick provider",
      },
      {
        "ge",
        "<Cmd>lua require('codex').send_selection()<CR>",
        mode = "x",
        desc = "AI Nvim: send visual selection",
      },
    },
    config = function()
      require("codex").setup({
        split = "vertical", -- "horizontal" | "vertical" | "float"
        float = {
          width = 0.9,
          height = 0.85,
          border = "rounded",
        },
        default_provider = "codex",
        providers = {
          codex = {
            cmd = { "codex" },
          },
          cursor = {
            cmd = { "cursor-agent" },
          },
        },
        focus_after_send = false,
        escape_codex = "<C-h>", -- optional: Terminal-mode lhs to send <C-\><C-n> (omit to disable)
      })
    end,
  },
}
