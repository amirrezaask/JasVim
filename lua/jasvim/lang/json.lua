jasvim.plugin "b0o/schemastore.nvim"

jasvim.L("nvim-treesitter.install").ensure_installed "json"
jasvim.L("lspconfig").jsonls.setup {
  settings = {
    json = {
      schemas = jasvim.L("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}
