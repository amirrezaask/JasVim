jasvim.L("nvim-treesitter.install").ensure_installed "haskell"
jasvim.L("lspconfig").hls.setup {
  on_attach = lsp.on_attach,
}
