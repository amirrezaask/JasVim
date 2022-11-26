# JasVim

## Why another distro when we have awesome ones like [AstroNvim](https://astronvim.github.io/) or [LunarVim](https://www.lunarvim.org/) ?
Most vim and also emacs distros will try to mimic the experience and ideas from tools like VSCode or Intelij IDEs and I'm not saying
this is wrong or anything but I think both Vim/Neovim and Emacs are different and need different thinking and maybe the audience of these
tools are not same as out of the box tools I mentioned. I think Vim/Neovim and Emacs are tools to create your own personalized developer environment
and not necesarily a conventional IDE with the same experience, maybe at start they seem hard or unproductive but I believe from my own experience and many other
people from the community of these tools, after few weeks of customizing you will feel the magic and ease of being able to customize everything to your liking
and you will feel more powerful.

## Why JasVim is different ?
JasVim is designed to be a simpler start for someone coming to neovim and yet it's not trying to abstract everything away. Flow of things is pretty clear and obvious
, there is no hidden logic and everything starts at `init.lua` and you can easily follow everything from there and start customizing anything you want, it's more like a 
a simple framework to start with and provide some sane defaults and also some plugins that most of the community agrees on is also included.

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

