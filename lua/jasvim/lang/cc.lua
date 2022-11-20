jasvim.L("nvim-treesitter.install").ensure_installed "c"
jasvim.L("nvim-treesitter.install").ensure_installed "cpp"

jasvim.L("lspconfig").clangd.setup {
  on_attach = lsp.on_attach,
}
