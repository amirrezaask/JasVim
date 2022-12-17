local has, _ = pcall(require, "nvim-autopairs")
if not has then
  return
end
require("nvim-autopairs").setup()
