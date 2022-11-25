local M = {}

function M.plugins()
  return {

    "neovim/nvim-lspconfig",
    {
      "ray-x/lsp_signature.nvim",
    },
    {
      "glepnir/lspsaga.nvim",
      branch = "main",
    },
    "onsails/lspkind.nvim",
    "williamboman/mason-lspconfig.nvim",
  }
end
_G.jvim.lsp = {}

function jvim.lsp.config(name, opts)
  jvim.with("lspconfig", function(lspconfig)
    lspconfig[name].setup(opts)
  end)
end

function jvim.lsp.on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  jvim.bind {
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
function M.configs()
  jvim.with("fidget", function(fidget)
    fidget.setup {}
  end)

  jvim.with("mason-lspconfig", function(mason_lspconfig)
    mason_lspconfig.setup {
      automatic_installation = true,
    }
  end)

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
  jvim.with("lspsaga", function(lspsaga)
    lspsaga.init_lsp_saga {
      symbol_in_winbar = {
        enable = true,
      },
    }
  end)
end
_G.lsp = jvim.lsp
return M
