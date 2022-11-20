jasvim.plugin "ziglang/zig.vim"

require("nvim-treesitter.install").ensure_installed "zig"
require("lspconfig").zls.setup {
  on_attach = lsp.on_attach,
}
