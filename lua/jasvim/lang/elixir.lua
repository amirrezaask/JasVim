require("nvim-treesitter.install").ensure_installed "elixir"
require("lspconfig").elixirls.setup {
  on_attach = lsp.on_attach,
  cmd = { os.getenv "HOME" .. "/.local/elixir-ls/language_server.sh" },
}
