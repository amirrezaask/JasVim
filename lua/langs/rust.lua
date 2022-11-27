treesitter.ensure "rust"

plugin {
  "rust-lang/rust.vim",
}

plugin {
  "simrat39/rust-tools.nvim",
  config = function()
    local rt = require "rust-tools"
    rt.setup {
      server = {
        on_attach = function(_, bufnr)
          lsp.on_attach(_, bufnr)
          bind {
            n = {
              C = { rt.hover_actions.hover_actions, desc = "Hover code actions", buffer = bufnr },
              ga = { rt.code_action_group.code_action_group, desc = "Code actions", buffer = bufnr },
            },
          }
        end,
      },
    }
  end,
}

if langs.autoformat and langs.rust and langs.rust.autoformat then
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.rs",
    callback = function(meta)
      vim.lsp.buf.format()
    end,
  })
end
