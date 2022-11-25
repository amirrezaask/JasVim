local M = {}

function M.configs()
  jvim.treesitter.ensure "rust"

  jvim.with("rust-tools", function(rt)
    rt.setup {
      server = {
        on_attach = function(_, bufnr)
          lsp.on_attach(_, bufnr)
          jvim.bind {
            n = {
              C = { rt.hover_actions.hover_actions, desc = "Hover code actions", buffer = bufnr },
              ga = { rt.code_action_group.code_action_group, desc = "Code actions", buffer = bufnr },
            },
          }
        end,
      },
    }

    jvim.onsave {
      pattern = "*.rs",
      callback = function()
        vim.lsp.buf.format()
      end,
    }
  end)
end

function M.plugins()
  return { "rust-lang/rust.vim", "simrat39/rust-tools.nvim" }
end

return M
