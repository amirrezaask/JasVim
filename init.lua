-- Jasvim
-- Core libraries and helpers are in $HOME/.config/nvim/lua/core/*.lua
-- Configurations for all plugins reside in $HOME/.config/nvim/lua/plugins/<plugin name>.lua
-- Language configurations are in $HOME/.config/nvim/lua/langs/<language name>.lua
-- All configurations will load automatically and there is no need to source your stuff in your init.lua
-- Also some plugins are grouped under one group name forexample all git related plugins are in git.lua

local core = require "core"

-- run plugins files
core.plugins()
