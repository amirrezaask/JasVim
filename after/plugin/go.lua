local ok, _ = pcall(require, "go")
if not ok then
  return
end

local keymaps = require "amirrezaask.keymaps"

require("go").setup()

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.go",
  group = _G.go_group,
  callback = function(meta)
    local utils = require "core.utils"
    keymaps.buf_nnoremap(meta.buffer, "<leader>lat", "<cmd>GoAddTag<CR>", { remap = true })
    keymaps.buf_nnoremap(meta.buffer, "<leader>lrt", "<cmd>GoRmTag<CR>", { remap = true })
    keymaps.buf_nnoremap(meta.buffer, "<leader>lfs", "<cmd>GoFillStruct<CR>", { remap = true })
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
    keymaps.buf_nnoremap(meta.buffer, "<leader>p", go_palete)
  end,
})

lsp.config "gopls"

-- Auto format
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.go",
  group = go_group,
  callback = function(_)
    vim.lsp.buf.format()
  end,
})
