_G.go_group = vim.api.nvim_create_augroup("GoModule", {})
plugin {
  "fatih/vim-go",
  config = function()
    vim.g.go_gopls_enabled = false -- we do the LSP using our own systems
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.go",
      group = _G.go_group,
      callback = function(meta)
        local utils = require "core.utils"
        buf_nnoremap(meta.buffer, "<leader>lat", "<cmd>GoAddTag<CR>", { remap = true })
        buf_nnoremap(meta.buffer, "<leader>lrt", "<cmd>GoRmTag<CR>", { remap = true })
        buf_nnoremap(meta.buffer, "<leader>lfs", "<cmd>GoFillStruct<CR>", { remap = true })
        local go_palete = function()
          vim.ui.select(vim.fn.getcompletion("Go", "command"), {}, function(cmd)
            if cmd == "" then
              return
            end
            local command = utils.get_command(cmd)
            if command.nargs == "0" then
              vim.cmd(cmd)
            else
              vim.cmd [[ stopinsert ]]
              vim.fn.feedkeys(string.format(":%s ", cmd), "n")
            end
          end)
        end
        buf_nnoremap(meta.buffer, "<leader>p", go_palete)
      end,
    })
  end,
}

treesitter.ensure "go"
lsp.config("gopls", {
  on_attach = lsp.on_attach,
})

if config(langs, "autoformat", "go.autoformat") then
  vim.api.nvim_create_autocmd("BufWritePost", {
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
