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
any many improvements to vanilla neovim experience


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

### Jasvim structure
#### Init flow
JasVim utilizes `packer.nvim` and uses it's declarative syntax for most plugins configurations.
In short, jasvim `init.lua` does following:
- Load `core` modules, which will load basic functionalities and plugins that are in `lua/core/*.lua`.
- Scan `lua/langs` and `lua/plugins` for lua files and load them all.
- Finally it will call `:PackerInstall` command which will install all missing plugins.
- That's it

#### Plugins
All plugin configurations are in `lua/plugins/<plugin name>.lua`.

#### Languages
All language configurations are in `lua/langs/<language name>.lua`.

## Screenshots
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/0.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/1.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/2.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/3.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/4.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/5.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/6.png)
![Screenshot](https://raw.github.com/amirrezaask/jasvim/master/screenshots/7.png)

