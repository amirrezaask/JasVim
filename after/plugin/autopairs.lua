local ok, _ = pcall(require, "nvim-autopairs")
if not ok then
  return
end

require("nvim-autopairs").setup()
