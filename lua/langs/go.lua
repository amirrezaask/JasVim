_G.go_group = vim.api.nvim_create_augroup("GoModule", {})
plugin {
  "ray-x/go.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("go").setup()
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.go",
      group = _G.go_group,
      callback = function(meta)
        buf_nnoremap(meta.buffer, "<leader>lat", "<cmd>GoAddTag<CR>", { remap = true })
        buf_nnoremap(meta.buffer, "<leader>lrt", "<cmd>GoRmTag<CR>", { remap = true })
        buf_nnoremap(meta.buffer, "<leader>lfs", "<cmd>GoFillStruct<CR>", { remap = true })
      end,
    })
  end,
}

treesitter.ensure "go"
lsp.config("gopls", {
  on_attach = lsp.on_attach,
})

if langs.autoformat and langs.go and langs.go.autoformat then
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    group = go_group,
    callback = function(meta)
      local ok, _ = pcall(require, "plenary")
      if not ok then
        return
      end
      local Job = require "plenary.job"
      local j = Job:new {
        "goimports",
        meta.file,
      }
      local output = j:sync()
      if j.code ~= 0 then
        vim.schedule(function()
          vim.api.nvim_err_writeln "cannot format using goimports"
        end)
      else
        vim.api.nvim_buf_set_lines(meta.buf, 0, -1, false, output)
      end
    end,
  })
end
