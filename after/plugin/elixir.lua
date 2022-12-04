require("nvim-treesitter.install").ensure_installed "elixir"

lsp.config("elixirls", {
  on_attach = lsp.on_attach,
})
