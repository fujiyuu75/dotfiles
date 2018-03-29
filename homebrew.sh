#!/bin/bash

set -e

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade

formulas=(
    arpack
    autoconf
    curl
    cask
    coreutils
    diff-so-fancy
    fontconfig
    freetype
    git
    hdf5
    httpie
    mecab
    mecab-ipadic
    node
    peco
    python3
    pyenv
    pyenv-virtualenv
    socat
    tree
    zsh
    wget
)

"brew tap..."
brew tap caskroom/fonts

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    font-source-han-code-jp
    google-chrome
    google-japanese-ime
    slack
    iterm2
    atom
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
