use "pbrisbin/vim-mkdir"

use "sheerun/vim-polyglot"

use "szw/vim-maximizer"

use "fladson/vim-kitty"

use "towolf/vim-helm"

use "tpope/vim-surround"

use "junegunn/vim-easy-align"

use "kevinhwang91/nvim-bqf"

use "tpope/vim-eunuch"

use "tpope/vim-sleuth"

use {
  "windwp/nvim-autopairs"
}


function configs.autopair()
  require("nvim-autopairs").setup {}
end
