function configs.elixir()
  treesitter.ensure "elixir"

  lsp.config("elixirls", {
    on_attach = lsp.on_attach,
  })
end
