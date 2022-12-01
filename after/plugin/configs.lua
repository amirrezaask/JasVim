vim.cmd.PackerInstall()

for _, cfg in pairs(configs) do
  cfg()
end

require("which-key").setup {}
