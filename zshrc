## oh-my-zsh
export ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_THEME="bitserf"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

## environment
export EDITOR=vim
export SVN_EDITOR="$EDITOR"
export GIT_EDITOR="$EDITOR"
export VISUAL=$EDITOR
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export CDPATH=.:$HOME:$HOME/Code
export EMAIL=ljb@bitserf.org
export PATH=$HOME/.bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

## aliases
alias ls='ls -GFh'

## zsh options
setopt NO_BEEP
setopt AUTO_PARAM_SLASH
setopt NO_AUTO_MENU
setopt NO_MENU_COMPLETE

