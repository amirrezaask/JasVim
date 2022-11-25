local M = {}
function M.plugins()
  return { "ziglang/zig.vim" }
end

function M.configs()
  jvim.treesitter.ensure "zig"
  jvim.lsp.config("zls", {
    on_attach = lsp.on_attach,
  })
end

return M
