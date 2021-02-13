autoload -U promptinit; promptinit
prompt pure

# env variables for android development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias vim=nvim
alias v=nvim
alias ls="ls -G"
alias ll="ls -l"
alias la="ll -a"
alias code=code-insiders
