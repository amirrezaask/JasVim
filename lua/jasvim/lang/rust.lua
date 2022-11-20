jasvim.plugin "rust-lang/rust.vim"
jasvim.plugin "simrat39/rust-tools.nvim"

local rt = jasvim.L "rust-tools"

jasvim.L("nvim-treesitter.install").ensure_installed "rust"

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

jasvim.onsave("*.rs", function()
  vim.lsp.buf.format()
end)
