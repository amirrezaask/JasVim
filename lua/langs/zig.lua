plugin {
  "ziglang/zig.vim",
  config = function()
    treesitter.ensure "zig"
    lsp.config("zls", {
      on_attach = lsp.on_attach,
    })
  end,
}
