local M = {}

function M.configs()
  local rt = jasvim.L "rust-tools"

  require("nvim-treesitter.install").ensure_installed "rust"

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

  jasvim.onsave {
    pattern = "*.rs",
    callback = function()
      vim.lsp.buf.format()
    end,
  }
end

function M.plugins()
  return { "rust-lang/rust.vim", "simrat39/rust-tools.nvim" }
end

return M
