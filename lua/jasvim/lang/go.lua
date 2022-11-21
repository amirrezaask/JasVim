local M = {}

function M.plugins()
  return {
    "nvim-lua/plenary.nvim",
    "fatih/vim-go",
  }
end

M.keymaps = {
  v = {
    ["<leader>at"] = "<cmd>GoAddTags<cr>",
  },
}

function M.configs()
  require("nvim-treesitter.install").ensure_installed "go"

  require("lspconfig").gopls.setup {
    on_attach = lsp.on_attach,
  }

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.go",
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
  })
end

return M
