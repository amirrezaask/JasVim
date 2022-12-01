use "Glench/Vim-Jinja2-Syntax"
function configs.python()
  treesitter.ensure "python"

  lsp.config("jedi_language_server", {
    on_attach = lsp.on_attach,
  })
end
