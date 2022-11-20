_G.jasvim = {}

function jasvim.onsave(pattern, callback)
  local augroup_name = ""
  if type(pattern) == "table" then
    augroup_name = table.concat(pattern, ",") .. "-onsave"
  end
  if type(pattern) == "string" then
    augroup_name = pattern .. "-onsave"
  end
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup(augroup_name, {}),
    pattern = pattern,
    callback = callback,
  })
end
jasvim.window_height = function()
  return vim.api.nvim_win_get_height(0)
end

jasvim.window_width = function()
  return vim.api.nvim_win_get_width(0)
end


function jasvim.L(name)
  local exists, _ = pcall(require, name)
  if exists then
    return require(name) 
  end
  vim.api.nvim_err_writeln(string.format("module %s does not exists", name))
end
-- Enable modules
-- @param names: table
function jasvim.modules(names)
  for _, name in ipairs(names) do
    jasvim.L(name)
  end
end

