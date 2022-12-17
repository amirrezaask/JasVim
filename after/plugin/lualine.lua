local has, _ = pcall(require, "lualine")
if not has then
  return
end

require("lualine").setup {
  options = {
    icons_enabled = false,
    theme = "auto",
    component_separators = "|",
    section_separators = "",
  },
}
