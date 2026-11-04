return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python" },
        callback = function()
	    vim.treesitter.start()
        end,
      })
    end,
  },
}
