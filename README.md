# JasVim

## How to install
### Linux & macOS
```bash
bash <(curl -s https://raw.githubusercontent.com/amirrezaask/jasvim/master/install.sh)
```
## Features
- LSP + Automatic install of LSP servers
- Tree file explorer using `nvim-tree`
- `Telescope` fuzzy finder + `Fzf` fuzzy finder
- Tmux integration
- Terminal emulator using `toggleterm`
any many improvements to vanilla neovim experience

## Keymaps
| Key | Description |
| --- | ----------- |
| <C-`> | Toggle terminal emulator |
| SPC SPC | find files |
| SPC f f | find files |
| SPC f g | git files |
| SPC p | command palete |
| ?? | live grep |

## How it's built
JasVim is built with isolated modules that can be enabled or disabled by the user.
each module should have following structure:
```lua

local Module = {}
Module.plugins = {} -- a table that contains a list of all plugin specs that module needs to install, specs are packer.nvim spec.
function Module.configs() end -- configs is a function and is called after all plugins are resolved from all modules.
Module.keymaps = {} -- keymaps is a table that will get passed to `jasvim.bind` function
```
```lua
local random_module = {}
function random_module.configs()
    -- configuring plugin 1
    -- configuring plugin 2
end


function random_module.plugins()
    return { -- same syntax as packer.nvim spec
        "some_author/plugin name",
        { "some_author/plugin name", requires = "another plugin"},
    }
end

return random_module

```

## Screenshots
![Start screen](https://raw.github.com/amirrezaask/jasvim/master/screenshots/0.png)
![fuzzy finder](https://raw.github.com/amirrezaask/jasvim/master/screenshots/1.png)
![some go code](https://raw.github.com/amirrezaask/jasvim/master/screenshots/2.png)
![live grep](https://raw.github.com/amirrezaask/jasvim/master/screenshots/3.png)

