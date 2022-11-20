jasvim.L("nvim-treesitter.install").ensure_installed "php"
jasvim.L("lspconfig").intelephense.setup {
  on_attach = lsp.on_attach,
}
