#!/bin/bash

set -e

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
chsh -s /bin/zsh

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
