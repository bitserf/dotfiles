## functions

reload() {
  source ~/.zshrc 
}
has_exe() {
  which $1 &>/dev/null
}
is_osx() {
  [ "`uname`" = "Darwin" ]
}
is_linux() {
  [ "`uname`" = "Linux" ]
}
prepend_path() {
  p=$1
  if [ ! -d $p ]; then
    return
  fi
  idx=${path[(i)$p]}
  if [[ ${idx} -lt ${#path} ]]; then path[${idx}]=(); fi
  path=($p $path)
}

## environment

has_exe lesspipe && export LESSOPEN="|lesspipe %s"
has_exe lesspipe.sh && export LESSOPEN="|lesspipe.sh %s"

export LS_COLORS='rs=0:di=00;34:ln=00;36:mh=00:pi=40;33:so=00;35:do=00;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.tlz=00;31:*.txz=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.dz=00;31:*.gz=00;31:*.lz=00;31:*.xz=00;31:*.bz2=00;31:*.bz=00;31:*.tbz=00;31:*.tbz2=00;31:*.tz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.rar=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.svg=00;35:*.svgz=00;35:*.mng=00;35:*.pcx=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.m2v=00;35:*.mkv=00;35:*.ogm=00;35:*.mp4=00;35:*.m4v=00;35:*.mp4v=00;35:*.vob=00;35:*.qt=00;35:*.nuv=00;35:*.wmv=00;35:*.asf=00;35:*.rm=00;35:*.rmvb=00;35:*.flc=00;35:*.avi=00;35:*.fli=00;35:*.flv=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.yuv=00;35:*.cgm=00;35:*.emf=00;35:*.axv=00;35:*.anx=00;35:*.ogv=00;35:*.ogx=00;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export PAGER=less
export EDITOR=vim
export SVN_EDITOR="$EDITOR -f"
export GIT_EDITOR="$EDITOR -f"
export VISUAL=$EDITOR
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export EMAIL=ljb@bitserf.org
export NODE_PATH=/usr/local/lib/node

prepend_path ~/.bin
prepend_path /usr/local/bin
prepend_path /usr/local/sbin
prepend_path ~/.rbenv/bin
prepend_path ~/.rbenv/shims

## aliases
is_osx && alias ls='ls -G'
is_linux && alias ls='ls --color=auto -F'
alias vi=vim
alias s=sqlite3
alias grep='grep --color=auto'
alias ec='emacsclient -n -a ""'

## zsh options
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt AUTO_PARAM_SLASH
setopt AUTO_LIST
setopt NO_BAD_PATTERN
setopt NO_BEEP
setopt BANG_HIST
setopt BSD_ECHO
setopt INC_APPEND_HISTORY
setopt HIST_NO_STORE
setopt MARK_DIRS
setopt C_BASES
setopt SHARE_HISTORY
setopt NO_CHECK_JOBS
setopt CLOBBER
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt NO_CORRECT
setopt NO_CORRECT_ALL
setopt EQUALS
setopt NO_FLOW_CONTROL
setopt NO_AUTO_MENU
setopt NO_MENU_COMPLETE
setopt NO_NOMATCH
setopt RM_STAR_SILENT
setopt NO_RM_STAR_WAIT
setopt NO_HUP
setopt PROMPT_SUBST

## key bindings
bindkey -e

## prompt
autoload -U colors && colors
autoload -U promptinit && promptinit
prompt bitserf

## rbenv
has_exe rbenv && eval "$(rbenv init -)"
