local M = {}

function M.plugins()
  return {
    "nvim-lua/plenary.nvim",
    "fatih/vim-go",
  }
end

function M.configs()
  require("nvim-treesitter.install").ensure_installed "go"

  require("lspconfig").gopls.setup {
    on_attach = lsp.on_attach,
  }

  local go_group = vim.api.nvim_create_augroup("GoModule", {})

  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.go",
    callback = function(meta)
      print("setting keymaps for " .. vim.inspect(meta))
      -- jasvim.buf_vnoremap(meta.buffer, "<leader>lat", "<cmd>GoAddTags<CR>")
      -- jasvim.vnoremap("<leader>lat", "<cmd>GoAddTags<CR>")
      -- TODO: investigate why above does not work
      vim.cmd(string.format([[ vnoremap <buffer> <leader>at <cmd>GoAddTags<CR>]], meta.buffer))
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
