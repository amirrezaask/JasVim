local M = {}

function M.plugins()
  return {
    "nvim-lua/plenary.nvim",
    "ray-x/go.nvim",
  }
end

function M.configs()
  require("nvim-treesitter.install").ensure_installed "go"

  require("lspconfig").gopls.setup {
    on_attach = lsp.on_attach,
  }

  require("go").setup()
  local go_group = vim.api.nvim_create_augroup("GoModule", {})

  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.go",
    callback = function(meta)
      jasvim.buf_nnoremap(meta.buffer, "<leader>gat", "<cmd>GoAddTag<CR>", { remap = true })
      jasvim.buf_nnoremap(meta.buffer, "<leader>grt", "<cmd>GoRmTag<CR>", { remap = true })
      jasvim.buf_nnoremap(meta.buffer, "<leader>gfs", "<cmd>GoFillStruct<CR>", { remap = true })
    end,
  })

  jasvim.onsave {
    pattern = "*.go",
    group = go_group,
    callback = function(meta)
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
  }
end

return M
