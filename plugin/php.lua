treesitter.ensure "php"

lsp.config("intelephense", {
  on_attach = lsp.on_attach,
})
