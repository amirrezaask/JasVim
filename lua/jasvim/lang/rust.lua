local M = {}

function M.configs()
  if jasvim.lang.has_treesitter "rust" then
    jasvim.treesitter.ensure "rust"
  end

  if jasvim.lang.has_lsp "rust" then
    jasvim.with("rust-tools", function(rt)
      rt.setup {
        server = {
          on_attach = function(_, bufnr)
            lsp.on_attach(_, bufnr)
            jasvim.bind {
              n = {
                C = { rt.hover_actions.hover_actions, desc = "Hover code actions", buffer = bufnr },
                ga = { rt.code_action_group.code_action_group, desc = "Code actions", buffer = bufnr },
              },
            }
          end,
        },
      }
    end)
  end

  if jasvim.lang.has_autoformat "rust" then
    jasvim.onsave {
      pattern = "*.rs",
      callback = function()
        vim.lsp.buf.format()
      end,
    }
  end
end

function M.plugins()
  return { "rust-lang/rust.vim", "simrat39/rust-tools.nvim" }
end

return M
