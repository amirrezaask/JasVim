local keymaps = require "core.keymaps"

use {
  "neovim/nvim-lspconfig",
  config = function()
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
  end,
}

use {
  "ray-x/lsp_signature.nvim",
}

use {
  "glepnir/lspsaga.nvim",
  branch = "main",
  config = function()
    require("lspsaga").init_lsp_saga {
      symbol_in_winbar = {
        enable = true,
      },
    }
  end,
}

use "onsails/lspkind.nvim"

use {
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup {}
  end,
}

use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {}
    keymaps.nnoremap("<leader>lt", "<cmd>TroubleToggle<CR>")
  end,
}

local lsp = {}

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
  require("lspconfig")[name].setup(opts)
end

_G.lsp = lsp

return lsp
