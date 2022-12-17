local has, _ = pcall(require, "zen-mode")
if not has then
  return
end
require("zen-mode").setup {}
vim.keymap.set("n", "<leader>z", vim.cmd.ZenMode)
