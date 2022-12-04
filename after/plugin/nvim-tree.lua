local ok, _ = pcall(require, "nvim-tree")
if not ok then
  return
end

require("nvim-tree").setup()
require("amirrezaask.keymaps").bind {
  n = {
    ["<leader>1"] = "<cmd>NvimTreeToggle<CR>",
  },
}
