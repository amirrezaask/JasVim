local ide = {}

function ide.plugins()
  return jasvim.append(
    require("jasvim.ide.completion").plugins(),
    require("jasvim.ide.git").plugins(),
    require("jasvim.ide.mason").plugins(),
    require("jasvim.ide.lsp").plugins(),
    require("jasvim.ide.dap").plugins(),
    require("jasvim.ide.terminal").plugins()
  )
end

function ide.configs()
  require("jasvim.ide.completion").configs()
  require("jasvim.ide.git").configs()
  require("jasvim.ide.mason").configs()
  require("jasvim.ide.lsp").configs()
  require("jasvim.ide.dap").configs()
  require("jasvim.ide.terminal").configs()
end
return ide
