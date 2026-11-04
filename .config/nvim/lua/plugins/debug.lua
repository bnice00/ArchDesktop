return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio", -- required by dap-ui
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,          desc = "Start / continue" },
      { "<leader>do", function() require("dap").step_over() end,         desc = "Step over" },
      { "<leader>di", function() require("dap").step_into() end,         desc = "Step into" },
      { "<leader>dO", function() require("dap").step_out() end,          desc = "Step out" },
      { "<leader>dq", function() require("dap").terminate() end,         desc = "Stop debugging" },
      { "<leader>du", function() require("dapui").toggle() end,          desc = "Toggle debug panels" },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      -- Use the python that has debugpy installed
      require("dap-python").setup("python3")
      dapui.setup()

      -- Open the panels when a session starts, close them when it ends
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end,
  },
}
