return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("ruff", {
  	capabilities = { general = { positionEncodings = { "utf-16" } } },
})
      -- Enable both servers (one list, not two arguments)
      vim.lsp.enable({ "pyright", "ruff" })

      -- Space c f = format the current file
      vim.keymap.set("n", "<leader>cf", function()
        vim.lsp.buf.format()
      end, { desc = "Format file" })

      -- Let pyright own hover docs; turn off ruff's near-empty version
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end
        end,
      })
    end,
  },
}
