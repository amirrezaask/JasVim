local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local function on_attach(_, bufnr)
  local keymaps = require "core.keymaps"
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  keymaps.bind {
    n = {
      gd = { vim.lsp.buf.definition, desc = "Goto definition", buffer = bufnr },
      gi = { vim.lsp.buf.implementation, desc = "Goto implementations", buffer = bufnr },
      gr = { vim.lsp.buf.references, desc = "Goto references", buffer = bufnr },
      R = { vim.lsp.buf.rename, desc = "Rename symbol under cursor", buffer = bufnr },
      K = { vim.lsp.buf.hover, desc = "Hover docs under cursor", buffer = bufnr },

      ["<leader>lf"] = { vim.lsp.buf.format, desc = "format buffer", buffer = bufnr },

      ["<leader>ld"] = { vim.diagnostic.open_float, desc = "Show floating diagnostics", buffer = bufnr },
      ["[d"] = { vim.diagnostic.goto_prev, desc = "Goto previous diagnostic", buffer = bufnr },
      ["]d"] = { vim.diagnostic.goto_next, desc = "Goto next diagnostic", buffer = bufnr },

      ["<A-p>"] = { vim.diagnostic.goto_prev, desc = "Goto previous diagnostic", buffer = bufnr },
      ["<A-n>"] = { vim.diagnostic.goto_next, desc = "Goto next diagnostic", buffer = bufnr },

      ["C"] = { vim.lsp.buf.code_action, desc = "Code Actions", buffer = bufnr },

      ["<C-s>"] = { vim.lsp.buf.signature_help, desc = "Toggle Signature help", buffer = bufnr },
    },
    i = {
      ["<C-s>"] = { vim.lsp.buf.signature_help, desc = "Toggle Signature help", buffer = bufnr },
    },
  }
  local ok, signature = pcall(require, "lsp-Signature")
  if ok then
    signature.on_attach({}, bufnr)
  end
end

vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format()
end, {})

local servers = {
  "clangd",
  "elixirls",
  "gopls",
  "hls",
  {
    "jsonls",
    {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    },
  },
  {
    "sumneko_lua",
    {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },
  },
  "intelephense",
  "purescriptls",
  "jedi_language_server",
  "rust_analyzer",
  "zls",
}

for _, srv in ipairs(servers) do
  if type(srv) == "string" then
    require("lspconfig")[srv].setup {
      on_attach = on_attach,
    }
  end

  if type(srv) == "table" then
    require("lspconfig")[srv[1]].setup(vim.tbl_extend("keep", srv[2], {
      on_attach = on_attach,
    }))
  end
end
