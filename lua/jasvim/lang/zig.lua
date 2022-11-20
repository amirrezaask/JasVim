jasvim.plugin "ziglang/zig.vim"

jasvim.L("nvim-treesitter.install").ensure_installed "zig"
jasvim.L("lspconfig").zls.setup {
  on_attach = lsp.on_attach,
}
