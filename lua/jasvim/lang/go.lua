local M = {}

function M.plugins()
  return {
    { "ray-x/go.nvim", requires = { "nvim-lua/plenary.nvim" } },
  }
end

function M.configs()
  if jasvim.lang.has_treesitter "go" then
    jasvim.treesitter.ensure "go"
  end

  if jasvim.lang.has_lsp "go" then
    jasvim.lsp.config("gopls", {
      on_attach = lsp.on_attach,
    })
  end

  local go_group = vim.api.nvim_create_augroup("GoModule", {})
  if jasvim.plugin_exists "go" then
    require("go").setup()
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.go",
      group = go_group,
      callback = function(meta)
        jasvim.buf_nnoremap(meta.buffer, "<leader>lat", "<cmd>GoAddTag<CR>", { remap = true })
        jasvim.buf_nnoremap(meta.buffer, "<leader>lrt", "<cmd>GoRmTag<CR>", { remap = true })
        jasvim.buf_nnoremap(meta.buffer, "<leader>lfs", "<cmd>GoFillStruct<CR>", { remap = true })
        jasvim.buf_nnoremap(
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

  if jasvim.lang.has_autoformat "go" then
    jasvim.onsave {
      pattern = "*.go",
      group = go_group,
      callback = function(meta)
        if not jasvim.plugin_exists "plenary" then
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
end

return M
