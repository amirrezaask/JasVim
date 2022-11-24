#!/usr/bin/env bash
#
cp $HOME/.config/nvim $HOME/.config/nvim.backup
git clone https://github.com/amirrezaask/jasvim $HOME/.config/nvim --depth 1
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'
