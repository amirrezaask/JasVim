use {
  "purescript-contrib/purescript-vim",
}

function configs.purescript()
  lsp.config("purescriptls", {
    on_attach = lsp.on_attach,
  })
end
