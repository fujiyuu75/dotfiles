#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

#
# Path setting.
#

# pyenv&virtualenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# android
export PATH="$HOME/Desktop/dex2jar-0.0.9.9/dex2jar.bat:$PATH"
export PATH="/Applications/android-ndk-r9i:$PATH"
export PATH="/Applications/android-sdk-r24.2-macosx/platform-tools:$PATH"
export PATH="/Applications/android-sdk-r24.2-macosx/tools:$PATH"
export PATH="$HOME/git_repos/library/android:$PATH"

# homebrew
alias brew="env PATH=${PATH/\/Users\/y_fujikawa\/\.pyenv\/shims:/} brew"

#
# History setting.
#

# export HISTFILE=${HOME}/dotfiles/.zhistory
setopt hist_ignore_dups

#
# homebrew-cask install location setting.
#

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#
# Rewrites tab title.
#

function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

#
# Incremental Search Command by Peco.
#

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

#
# Android decompile
#

# Decompile Java classes recursively keeping hierarchy
jadr() {
    jad -8 -s java -d $2 -r $1/**/*.class
}

# Decompile Android application
deapk() {
    local dst=${${1##*/}%%.*}
    dst+=".depackaged.`date +"%Y%m%d%H%M"`"
    unzip $1 -d $dst
    d2j-dex2jar -o ${dst}/classes-dex2jar.jar ${dst}/classes.dex
    mkdir -p ${dst}/classes
    unzip ${dst}/classes-dex2jar.jar -d ${dst}/classes
    jadr ${dst} ${dst}/src
}

#
# Alias.
#

# Android.
alias activity='adb shell dumpsys activity | grep -B 1 "Run #[0-9]*:"'
alias fragment='adb shell dumpsys activity top'

# Moves multi dir.
alias ...='cd ../..'
alias ....='cd ../../..'

# Pygments alias.
alias c='pygmentize -O style=monokai -f console256 -g'

# Pygments alias for less command.
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/y_fujikawa/y/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/y_fujikawa/y/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/y_fujikawa/y/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/y_fujikawa/y/google-cloud-sdk/completion.zsh.inc'; fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/y_fujikawa/Develop/develop/uncovertruth/ca/ca-infra/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/y_fujikawa/Develop/develop/uncovertruth/ca/ca-infra/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/y_fujikawa/Develop/develop/uncovertruth/ca/ca-infra/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/y_fujikawa/Develop/develop/uncovertruth/ca/ca-infra/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/y_fujikawa/Develop/develop/uncovertruth/ca/ca-infra/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/y_fujikawa/Develop/develop/uncovertruth/ca/ca-infra/node_modules/tabtab/.completions/slss.zsh
