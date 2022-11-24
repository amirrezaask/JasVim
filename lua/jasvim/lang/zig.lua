local M = {}
function M.plugins()
  return { "ziglang/zig.vim" }
end

function M.configs()
  if jvim.plugin_exists "nvim-treesitter" then
    require("nvim-treesitter.install").ensure_installed "zig"
  end
  if jvim.plugin_exists "lspconfig" then
    require("lspconfig").zls.setup {
      on_attach = lsp.on_attach,
    }
  end
end

return M
