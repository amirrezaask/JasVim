require("nvim-treesitter.install").ensure_installed "c"
require("nvim-treesitter.install").ensure_installed "cpp"

lsp.config("clangd", {
  on_attach = lsp.on_attach,
})
