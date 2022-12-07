require("neodev").setup {}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function(_)
    vim.lsp.buf.format()
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.lua",
  callback = function()
    vim.cmd [[ setlocal sts=2 sw=2 ]]
  end,
})
