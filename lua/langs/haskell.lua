function configs.haskell()
  treesitter.ensure "haskell"
  lsp.config("hls", {
    on_attach = lsp.on_attach,
  })
end
