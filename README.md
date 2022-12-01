# JasVim
## How to install
### Linux & macOS
```bash
bash <(curl -s https://raw.githubusercontent.com/amirrezaask/jasvim/master/install.sh)
```
**Note** : remember that if installation stuck due to network problems just exit and re enter and it will continue were it failed,
in my country due to network problems this happens a lot to me.

## Features
- LSP + Automatic install of LSP servers
- Tree file explorer using `nvim-tree`
- `Telescope` fuzzy finder + `Fzf` fuzzy finder
- Tmux integration
- Terminal emulator using `toggleterm`


## Why another distro when we have awesome ones like [AstroNvim](https://astronvim.github.io/) or [LunarVim](https://www.lunarvim.org/) ?
Most vim and also emacs distros will try to mimic the experience and ideas from tools like VSCode or Intelij IDEs and I'm not saying
this is wrong or anything but I think both Vim/Neovim and Emacs are different and need different thinking and maybe the audience of these
tools are not same as out of the box tools I mentioned. I think Vim/Neovim and Emacs are tools to create your own personalized developer environment
and not necesarily a conventional IDE with the same experience, maybe at start they seem hard or unproductive but I believe from my own experience and many other
people from the community of these tools, after few weeks of customizing you will feel the magic and ease of being able to customize everything to your liking
and you will feel more powerful.

## Why JasVim is different ?
JasVim is designed to be a simpler start for someone coming to neovim and yet it's not trying to abstract everything away. Flow of things is pretty clear and obvious
,there is no hidden logic and everything starts at `init.lua` and you can easily follow everything from there and start customizing anything you want, it's more like a 
a simple framework to start with and provide some sane defaults and also plugins that are defacto standards.

## Use as a template
This project is designed to be used not as a seperate distro but as a template to build your own configuration from it,
to do so use `Use this template` button and create a new repo from this template to hold your own configuration in it

## Jasvim structure
For understanding this configuration you need to know some things about neovim/vim startup process, both neovim and vim have several special
directories but the one we work with is `plugin` directory, you can see full documentation about all these special directories by checking `:h runtimepath`.
`plugin` directory was meant for users to store their scripts and vim/neovim will load everything inside those directories automaticaly.
If you look inside our `plugin` directory you will see configurations for all plugins we have except for some `core` ones like `lsp`, `treesitter` and `mason`.
after sourcing everything inside `plugin` directory neovim will source everything inside `after/plugin` as well but this is after all `plugin` content has been sourced.
We use this sequence of events and basically define all of our configs and all plugins that need to be installed and then in `after/plugin/configs.lua` we will first
install all required plugins and then run their configuration callback. In `init.lua` we just store some basic values for different plugins to use like the colorscheme we want.
so in summary:
- `init.lua` sets some defaults and user level configs
- `plugin/*.lua` will configure all plugins.
- `after/plugin/configs.lua` will install missing plugins and also run all configuration callbacks registered in `plugin/*.lua`

## API
Jasvim uses [packer.nvim](https://github.com/wbthomason/packer.nvim) as it's package manager for installing plugins
so you can always refer to  for it's keys and how to use it.
Also Jasvim has a global `configs` table that will contain callbacks for different plugins configuration,
every single function you define in this table will be called on startup so be carefull what you put in there,
mostly it should be plugin setup, keymaps, autocmds and these kind of stuff.

```lua
-- This will register go.nvim plugin for installation with it's requirements.
use {
  "ray-x/go.nvim",
  requires = { "nvim-lua/plenary.nvim" },
}
-- This function will be called in startup to configure anything related to go.
function configs.go()
  require("go").setup()
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.go",
        group = _G.go_group,
        callback = function(meta)
          buf_nnoremap(meta.buffer, "<leader>lat", "<cmd>GoAddTag<CR>", { remap = true })
          buf_nnoremap(meta.buffer, "<leader>lrt", "<cmd>GoRmTag<CR>", { remap = true })
          buf_nnoremap(meta.buffer, "<leader>lfs", "<cmd>GoFillStruct<CR>", { remap = true })
        end,
      })
end
```


## Themes
There is a list of all themes that are installed in this template and there is a `Theme` command to switch between them
and see which one you want and set it in your `init.lua`

### catppuccin
![Default Theme: catppuccin](https://raw.github.com/amirrezaask/jasvim/master/screenshots/catppuccin.png)

### catppuccin-mocha
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/catppuccin-mocha.png)

### catppuccin-macchiato
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/catppuccin-macchiato.png)

### catppuccin-latte
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/catppuccin-latte.png)

### catppuccin-frappe
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/catppuccin-frappe.png)

### dracula
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/dracula.png)

### gruvbox
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/gruvbox.png)

### monkai
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/monokai.png)

### moonfly
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/moonfly.png)

### nightfly
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/nightfly.png)

### nightfox 
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/nightfox.png)

### onedark 
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/onedark.png)

### rose-pine 
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/rose-pine.png)

### sonokai 
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/sonokai.png)

### tokyodark 
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/tokyodark.png)

### tokyonight-day 
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/tokyonight-day.png)

### tokyonight-moon 
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/tokyonight-moon.png)

### tokyonight-night 
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/tokyonight-night.png)

### tokyonight-storm 
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/tokyonight-storm.png)

### tokyonight 
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/tokyonight.png)

### ayu-mirage
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/ayu-mirage.png)

### ayu-light
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/ayu-light.png)

### ayu-dark
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/ayu-dark.png)

## Screenshots
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/0.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/1.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/2.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/3.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/4.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/5.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/6.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/7.png)

