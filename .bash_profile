
export PATH=~/Desktop/dex2jar-0.0.9.9/dex2jar.bat:$PATH

##
# Your previous /Users/y_fujikawa/.bash_profile file was backed up as /Users/y_fujikawa/.bash_profile.macports-saved_2013-05-31_at_15:43:46
##

# MacPorts Installer addition on 2013-05-31_at_15:43:46: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

eval "$(rbenv init -)"

#Android NDK PATH
ANDROID_NDK=/Applications/android-ndk-r9
export PATH=$PATH:${ANDROID_NDK}i

#python PATH
export PATH=$PATH:/usr/local/share/python:/usr/local/share/python3

#adb
export PATH=$PATH:/Applications/android-sdk-r24.2-macosx/platform-tools
export PATH=$PATH:/Applications/android-sdk-r24.2-macosx/tools

#android libs
export PATH=$PATH:/Users/y_fujikawa/git_repos/library/android

#homebrew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

##
#   Alias
##
alias ll="ls -la"
alias adbac="adb shell dumpsys activity | grep -B 1 "Run #[0-9]*:""
alias adbfr="adb shell dumpsys activity top"

