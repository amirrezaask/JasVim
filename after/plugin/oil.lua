local has, _ = pcall(require, "oil")
if not has then
  return
end

require("oil").setup {}
