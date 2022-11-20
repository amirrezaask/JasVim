jasvim.plugin "Glench/Vim-Jinja2-Syntax"

jasvim.L("lspconfig").jedi_language_server.setup {
  on_attach = lsp.on_attach,
}
