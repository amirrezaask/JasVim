use {
  "ziglang/zig.vim",
}

function configs.zig()
  treesitter.ensure "zig"
  lsp.config("zls", {
    on_attach = lsp.on_attach,
  })
end
