plugin { "cuducos/yaml.nvim" }
treesitter.ensure "yaml"
lsp.config("yamlls", {
  on_attach = jasvim.lsp.on_attach,
})
