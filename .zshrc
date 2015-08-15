source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle common-aliases
antigen bundle wd
antigen bundle fasd

## Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
## Load the theme.
# antigen theme skaro
antigen theme agnoster
# Tell antigen that you're done.
antigen apply

if [[ "$OSTYPE" == *"darwin"* ]]
then
    alias ls="ls -G"
	alias t="trash"
elif [[ "$OSTYPE" == *"linux"* ]]
then
    alias ls="ls --color=auto"
    alias t=gvfs-trash
fi

export EDITOR="nvim"
export GOPATH="$HOME/go"
export TERM="screen-256color"
alias v="nvim"
alias vvim="nvim ~/.nvimrc"
alias grep='grep --color=auto'
alias tmux="tmux -2"
alias http-server="http-server -p 9000 -a 127.0.0.1"
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

setopt AUTO_CD
setopt AUTO_LIST
setopt MENU_COMPLETE
unsetopt LIST_BEEP
setopt INC_APPEND_HISTORY
export KEYTIMEOUT=1
setopt AUTOPUSHD
setopt NO_BEEP

bindkey -v

function mcd () {
    mkdir "$@" && cd "$@"
}
function cs () {
    cd "$@" && ls
}
DEFAULT_USER=`whoami`

precmd() {
  RPROMPT=""
  }
  zle-keymap-select() {
    RPROMPT=""
  [[ $KEYMAP = vicmd ]] && RPROMPT="NORMAL"
    () { return $__prompt_status }
  zle reset-prompt
  }
  zle-line-init() {
    typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search


export PATH=/usr/local/bin:$PATH
export PATH=$HOME/Library/Haskell/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export ZDOTDIR=$HOME
export NODE_ENV=development

# PS1="%{$fg[cyan]%}%2~ %{$reset_color%}"

export NVM_DIR="/Users/marcusbuffett/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

function tr {
    tree -L 2;
}

# Really weird fix for Control-H not working in neovim, black magic below
# infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
# tic $TERM.ti

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
