local M = {}
function M.plugins()
  return { "ziglang/zig.vim" }
end

function M.configs()
  require("nvim-treesitter.install").ensure_installed "zig"
  require("lspconfig").zls.setup {
    on_attach = lsp.on_attach,
  }
end

return M
