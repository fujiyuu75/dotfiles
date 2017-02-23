#!/bin/bash

DOT_FILES=(
  .CFUserTextEncoding
  .Xauthority
  .babel.json
  .bash_history
  .bash_profile
  .eclipse_keyring
  .emulator_console_auth_token
  .gitattirubtes
  .gitconfig
  .gitignore_global
  .hgignore_global
  .lessfilter
  .lesshst
  .python_history
  .recently-used
  .rnd
  .viminfo
  .zcompdump
  .zcompdump.zwc
  .zhistory
)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
