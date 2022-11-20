jasvim.L("nvim-treesitter.install").ensure_installed "go"

jasvim.L("lspconfig").gopls.setup {
  on_attach = lsp.on_attach,
}

jasvim.onsave("*.go", function()
  vim.lsp.buf.format()
end)
