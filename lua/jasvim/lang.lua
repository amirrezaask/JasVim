local lang = {}

jasvim.lang = {}

jasvim.lang.defaults = jvim.language_defaults or {
  autoformat = false,
  lsp = true,
  treesitter = true,
}

function jasvim.lang.get_config(name, config)
  return jvim.languages[name][config] or jasvim.lang.defaults[config]
end

function jasvim.lang.has_feature(name, config)
  return jvim.languages[name][config] or jasvim.lang.defaults[config]
end

function jasvim.lang.has_treesitter(name)
  return jasvim.lang.has_feature(name, "treesitter")
end

function jasvim.lang.has_lsp(name)
  return jasvim.lang.has_feature(name, "lsp")
end

function jasvim.lang.has_autoformat(name)
  return jasvim.lang.has_feature(name, "autoformat")
end

function lang.configs()
  for name, _ in pairs(jvim.languages or {}) do
    require("jasvim.lang." .. name).configs()
  end
end

function lang.plugins()
  local plugins = {}
  for name, _ in pairs(jvim.languages or {}) do
    plugins = jasvim.append(plugins, require("jasvim.lang." .. name).plugins())
  end
  return plugins
end

return lang
