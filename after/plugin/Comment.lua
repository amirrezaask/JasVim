local has, _ = pcall(require, "Comment")
if not has then
  return
end
require("Comment").setup()
