require("nvim-treesitter.install").ensure_installed "php"
lsp.config("intelephense", {
  on_attach = lsp.on_attach,
})
