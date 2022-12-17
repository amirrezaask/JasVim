vim.g.go_gopls_enabled = 0
vim.g.go_template_autocreate = 0
local go_group = vim.api.nvim_create_augroup("go", {})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.go",
  group = go_group,
  callback = function(meta)
    local buffer = { buffer = meta.bufnr, remap = true }
    vim.keymap.set("n", "<leader>lat", "<cmd>GoAddTag<CR>", buffer)
    vim.keymap.set("n", "<leader>lrt", "<cmd>GoRmTag<CR>", buffer)
    vim.keymap.set("n", "<leader>lfs", "<cmd>GoFillStruct<CR>", buffer)
  end,
})
