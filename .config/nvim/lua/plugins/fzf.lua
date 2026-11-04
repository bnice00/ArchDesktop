return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
  { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
  { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Search text in projects"},
  { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Open buffers"},
  { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files"},
},
  },
}
