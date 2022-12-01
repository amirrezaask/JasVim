use {
  "L3MON4D3/LuaSnip",
  requires = "rafamadriz/friendly-snippets",
}

function configs.luasnip()
  require("luasnip.loaders.from_vscode").lazy_load()
end
