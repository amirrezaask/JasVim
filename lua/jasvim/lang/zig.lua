local M = {}
function M.plugins()
  return { "ziglang/zig.vim" }
end

function M.configs()
  if jasvim.lang.has_treesitter "zig" then
    jasvim.treesitter.ensure "zig"
  end
  if jasvim.lang.has_lsp "zig" then
    jasvim.lsp.config("zls", {
      on_attach = lsp.on_attach,
    })
  end
end

return M
