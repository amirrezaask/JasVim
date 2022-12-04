require("nvim-treesitter.install").ensure_installed "rust"
local rt = require "rust-tools"
rt.setup {
  server = {
    on_attach = function(_, bufnr)
      lsp.on_attach(_, bufnr)
      require("core.keymaps").bind {
        n = {
          C = { rt.hover_actions.hover_actions, desc = "Hover code actions", buffer = bufnr },
          ga = { rt.code_action_group.code_action_group, desc = "Code actions", buffer = bufnr },
        },
      }
    end,
  },
}

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.rs",
  callback = function(_)
    vim.lsp.buf.format()
  end,
})
