jasvim.plugin {
  "williamboman/mason.nvim",
}
jasvim.plugin "williamboman/mason-lspconfig.nvim"
jasvim.plugin "jayp0521/mason-nvim-dap.nvim"

jasvim.plugin "neovim/nvim-lspconfig"
jasvim.plugin {
  "ray-x/lsp_signature.nvim",
}
jasvim.plugin {
  "glepnir/lspsaga.nvim",
  branch = "main",
}
jasvim.plugin "onsails/lspkind.nvim"

_G.lsp = {}

require("fidget").setup()

function lsp.on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  bind {
    n = {
      gd = { vim.lsp.buf.definition, desc = "Goto definition", buffer = bufnr },
      gi = { vim.lsp.buf.implementation, desc = "Goto implementations", buffer = bufnr },
      gr = { vim.lsp.buf.references, desc = "Goto references", buffer = bufnr },
      R = { vim.lsp.buf.rename, desc = "Rename symbol under cursor", buffer = bufnr },
      K = { vim.lsp.buf.hover, desc = "Hover docs under cursor", buffer = bufnr },
      -- ["<c-d>"] = { vim.diagnostic.open_float, desc = "Show current line diagnostics", buffer = bufnr },
      ["[d"] = { vim.diagnostic.goto_prev, desc = "Goto previous diagnostic", buffer = bufnr },
      ["]d"] = { vim.diagnostic.goto_next, desc = "Goto next diagnostic", buffer = bufnr },
      ["C"] = { vim.lsp.buf.code_action, desc = "Code actions", buffer = bufnr },
      ["<C-s>"] = { vim.lsp.buf.signature_help, desc = "Toggle Signature help", buffer = bufnr },
    },
    i = {
      ["<C-s>"] = { vim.lsp.buf.signature_help, desc = "Toggle Signature help", buffer = bufnr },
    },
  }
  require("lsp_signature").on_attach({}, bufnr)
end

local border = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
require("lspsaga").init_lsp_saga {
  symbol_in_winbar = {
    enable = true,
  },
}
