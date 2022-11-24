local lang = {}

function lang.configs()
  require("jasvim.lang.lua").configs()
  require("jasvim.lang.json").configs()
  require("jasvim.lang.go").configs()
  require("jasvim.lang.php").configs()
  require("jasvim.lang.elixir").configs()
  require("jasvim.lang.cc").configs()
  require("jasvim.lang.rust").configs()
  require("jasvim.lang.haskell").configs()
  require("jasvim.lang.zig").configs()
  require("jasvim.lang.yaml").configs()
  require("jasvim.lang.python").configs()
  require("jasvim.lang.org").configs()
end

function lang.plugins()
  return jasvim.append(
    { "jansedivy/jai.vim" },
    require("jasvim.lang.lua").plugins(),
    require("jasvim.lang.json").plugins(),
    require("jasvim.lang.go").plugins(),
    require("jasvim.lang.php").plugins(),
    require("jasvim.lang.elixir").plugins(),
    require("jasvim.lang.cc").plugins(),
    require("jasvim.lang.rust").plugins(),
    require("jasvim.lang.haskell").plugins(),
    require("jasvim.lang.zig").plugins(),
    require("jasvim.lang.yaml").plugins(),
    require("jasvim.lang.python").plugins(),
    require("jasvim.lang.org").plugins
  )
end

return lang
