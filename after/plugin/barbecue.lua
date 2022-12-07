local ok, _ = pcall(require, "barbecue")
if not ok then
  return
end

require("barbecue").setup {}
