local lang = {}

function lang.configs()
  for _, l in ipairs(jvim.languages or {}) do
    require("jasvim.lang." .. l).configs()
  end
end

function lang.plugins()
  local plugins = {}
  for _, l in ipairs(jvim.languages or {}) do
    plugins = jvim.append(plugins, require("jasvim.lang." .. l).plugins())
  end
  return plugins
end

return lang
