#!/bin/bash

set -e
DOT_DIRECTORY="${HOME}/dotfiles"

cd $DOT_DIRECTORY

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = ".Trash" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
