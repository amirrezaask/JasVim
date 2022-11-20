jasvim.plugin "cuducos/yaml.nvim"

jasvim.L("nvim-treesitter.install").ensure_installed "yaml"
jasvim.L("lspconfig").yamlls.setup {
  on_attach = lsp.on_attach,
}
