# JasVim

## How to install
```bash
# back up your current configuration
cp $HOME/.config/nvim $HOME/.config/nvim.backup
git clone https://github.com/amirrezaask/jasvim ~/.config/nvim --depth 1
```

## Features
- LSP + Automatic install of 90% of LSP servers
- Tree file explorer using nvim-tree
- Telescope fuzzy finders
- Tmux integration

## How it's built
jasvim is built around modules,
modules are normal lua modules that are tables
and have to attributes, `plugins` function or table that is used for packer spec, `configs` function 
that configures plugins for respected module
for example:
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

