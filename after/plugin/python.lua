require("nvim-treesitter.install").ensure_installed "python"

lsp.config("jedi_language_server", {
  on_attach = lsp.on_attach,
})
