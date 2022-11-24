require "jasvim.core"

jasvim.colorscheme = "zephyr"
jasvim.transparent = false
jasvim.leader = " "
jasvim.fuzzy_finder = "telescope" -- it can be fzf | telescope

jasvim.modules {
  "jasvim.ui",
  "jasvim.editor",
  "jasvim.ide",
  "jasvim.lang",
  "jasvim.whichkey",
}
