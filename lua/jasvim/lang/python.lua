local M = {}

function M.configs()
  if jasvim.lang.has_treesitter "python" then
    jasvim.treesitter.ensure "python"
  end
  if jasvim.lang.has_lsp "python" then
    jasvim.lsp.config("jedi_language_server", {
      on_attach = lsp.on_attach,
    })
  end
end

function M.plugins()
  return { "Glench/Vim-Jinja2-Syntax" }
end

return M
