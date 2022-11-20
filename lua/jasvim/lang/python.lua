local M = {}

function M.configs()
  require("lspconfig").jedi_language_server.setup {
    on_attach = lsp.on_attach,
  }
end

function M.plugins()
  return { "Glench/Vim-Jinja2-Syntax" }
end

return M
