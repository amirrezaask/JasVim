local keymaps = require "amirrezaask.keymaps"

local lsp = {}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

function lsp.on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  keymaps.bind {
    n = {
      gd = { vim.lsp.buf.definition, desc = "Goto definition", buffer = bufnr },
      gi = { vim.lsp.buf.implementation, desc = "Goto implementations", buffer = bufnr },
      gr = { vim.lsp.buf.references, desc = "Goto references", buffer = bufnr },
      R = { vim.lsp.buf.rename, desc = "Rename symbol under cursor", buffer = bufnr },
      K = { vim.lsp.buf.hover, desc = "Hover docs under cursor", buffer = bufnr },
      ["<leader>lf"] = { vim.lsp.buf.format, desc = "format document", buffer = bufnr },
      ["[d"] = { vim.diagnostic.goto_prev, desc = "Goto previous diagnostic", buffer = bufnr },
      ["]d"] = { vim.diagnostic.goto_next, desc = "Goto next diagnostic", buffer = bufnr },
      ["C"] = { vim.lsp.buf.code_action, desc = "Code Actions", buffer = bufnr },
      ["<leader>ca"] = { vim.lsp.buf.code_action, desc = "Code Actions", buffer = bufnr },
      ["<C-s>"] = { vim.lsp.buf.signature_help, desc = "Toggle Signature help", buffer = bufnr },
    },
    i = {
      ["<C-s>"] = { vim.lsp.buf.signature_help, desc = "Toggle Signature help", buffer = bufnr },
    },
  }
  require("lsp_signature").on_attach({}, bufnr)
end

function lsp.config(name, opts)
  local ok, _ = pcall(require, "lspconfig")
  if not ok then
    return
  end
  opts = opts or {}
  if not opts.on_attach then
    opts.on_attach = lsp.on_attach
  end
  require("lspconfig")[name].setup(opts)
end

_G.lsp = lsp

return lsp
