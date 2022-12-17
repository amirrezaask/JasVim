# JasVim
## How to install

## Features
- LSP + Automatic install of LSP servers
- `Telescope` fuzzy finder
- Terminal emulator using `toggleterm`

## Use as a template
This project is designed to be used not as a seperate distro but as a template to build your own configuration from it,
to do so use `Use this template` button and create a new repo from this template to hold your own configuration in it

## Jasvim structure
Just following init.lua will help you find out how this works
## Adding a new plugin
1.Add plugin `use` directive to `plugin/packer.lua` file in setup function call like below.
```lua
use {
  "ray-x/go.nvim",
  requires = { "nvim-lua/plenary.nvim" },
}

```
2. For setting up the plugin and any configuration about it the conventional way is to put it
in `after/plugin/<plugin name>.lua`

