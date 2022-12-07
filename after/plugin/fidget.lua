local ok, _ = pcall(require, "fidget")

if not ok then
  return
end

require("fidget").setup()
