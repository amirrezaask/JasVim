vim.g.mapleader = " "
local M = {}

function M.bind(spec)
  for mode, keys in pairs(spec) do
    for key, binding in pairs(keys) do
      if type(binding) == "string" or type(binding) == "function" then
        vim.keymap.set(mode, key, binding)
      else
        if type(binding) == "table" then
          -- { function or string, doc }
          local handler = binding[1]
          table.remove(binding, 1)
          vim.keymap.set(mode, key, handler, binding)
        end
      end
    end
  end
end

function M.nnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", opts, { noremap = true })
  vim.keymap.set("n", lhs, rhs, opts)
end

function M.inoremap(lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", opts, { noremap = true })
  vim.keymap.set("i", lhs, rhs, opts)
end

function M.vnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", opts, { noremap = true })
  vim.keymap.set("v", lhs, rhs, opts)
end

function M.buf_nnoremap(buf, lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", opts, { noremap = true, buffer = buf })
  vim.keymap.set("n", lhs, rhs, opts)
end

function M.buf_inoremap(buf, lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", opts, { noremap = true, buffer = buf })
  vim.keymap.set("i", lhs, rhs, opts)
end

function M.buf_vnoremap(buf, lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", opts, { noremap = true, buffer = buf })
  vim.keymap.set("v", lhs, rhs, opts)
end

return M
