local ok, _ = pcall(require, "gitsigns")

if not ok then
  return
end

require("gitsigns").setup {}
