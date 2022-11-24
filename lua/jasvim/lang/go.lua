local M = {}

function M.plugins()
  return {
    { "ray-x/go.nvim", requires = { "nvim-lua/plenary.nvim" } },
  }
end

function M.configs()
  if jvim.plugin_exists "nvim-treesitter" then
    require("nvim-treesitter.install").ensure_installed "go"
  end

  if jvim.plugin_exists "lspconfig" then
    require("lspconfig").gopls.setup {
      on_attach = lsp.on_attach,
    }
  end

  local go_group = vim.api.nvim_create_augroup("GoModule", {})
  if jvim.plugin_exists "go" then
    require("go").setup()
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.go",
      group = go_group,
      callback = function(meta)
        jvim.buf_nnoremap(meta.buffer, "<leader>gat", "<cmd>GoAddTag<CR>", { remap = true })
        jvim.buf_nnoremap(meta.buffer, "<leader>grt", "<cmd>GoRmTag<CR>", { remap = true })
        jvim.buf_nnoremap(meta.buffer, "<leader>gfs", "<cmd>GoFillStruct<CR>", { remap = true })
        jvim.buf_nnoremap(
          meta.buffer,
          "<leader>p",
          require "jasvim.ui.telescope"("command_palete", {
            pattern = "Go",
          }),
          { remap = true }
        )
      end,
    })
  end

  jvim.onsave {
    pattern = "*.go",
    group = go_group,
    callback = function(meta)
      if not jvim.plugin_exists "plenary" then
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
  }
end

return M
