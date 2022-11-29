plugin {
  "purescript-contrib/purescript-vim",
  config = function()
    lsp.config("purescriptls", {
      on_attach = lsp.on_attach,
    })
  end,
}
