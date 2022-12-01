treesitter.ensure "c"
treesitter.ensure "cpp"
lsp.config("clangd", {
  on_attach = lsp.on_attach,
})
