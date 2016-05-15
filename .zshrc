source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle common-aliases
antigen bundle wd

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle ehamberg/zsh-cabal-completion
antigen theme agnoster
antigen apply

# Completion inits
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# OS-specific stuff
if [[ "$OSTYPE" == *"darwin"* ]]
then
    alias ls="ls -G"
    alias t="trash"
elif [[ "$OSTYPE" == *"linux"* ]]
then
    alias ls="ls --color=auto"
    alias t=gvfs-trash
fi

# Exports
export EDITOR="nvim"
export PATH="$PATH:~/.cargo/bin"
export GOPATH="$HOME/go"
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOPATH/bin"
export AWS_KEYPAIR_NAME=marcus
export NVM_DIR="/Users/marcusbuffett/.nvm"
export RUST_SRC_PATH="$HOME/Documents/etc/rust/src"
# export RUBYOPT=-rbumbler/go

# Aliases
alias v="nvim"
alias vi="nvim"
alias vvim="nvim ~/.vimrc"
alias nvvim="nvim ~/.config/nvim/init.vim"
alias cabal-world="cabal --no-require-sandbox --ignore-sandbox"
alias grep='grep --color=auto'
alias tmux="tmux -2"
# alias http-server="http-server -p 9000 -a 127.0.0.1"
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
alias dk='docker'
alias dkm='docker-machine'
alias gph='git push origin head'
alias todo='nvim ~/.todo.md'
alias gsuno='git status -uno -s'
alias gfs='git ls-files -m $(git rev-parse --show-toplevel)'
alias gcmu='git ls-files --exclude-standard --others| fzf -m | xargs git add'
alias gcmum='gfs | fzf -m | xargs git add'
alias gbzf='git checkout $(git branch --list | cut -c 3- | fzf)'
# function grmu() {
  # git status --short | awk "$0 ~ '^M' {print $2}" | fzf -m | xargs git reset HEAD
# }
alias gsm='git ls-files -m | fzf -m | xargs'
alias gwe='git commit -a --fixup'
# alias -g _gf='$(fasd -d | awk fzf)'
# alias z='_gf | xargs cd'
alias -g _lf='$(fzf)'
alias lf='vim _lf'
alias ds="fasd -d | tr -s ' ' | cut -d ' ' -f 2"

# Options
setopt AUTO_CD
setopt AUTO_LIST
setopt MENU_COMPLETE
unsetopt LIST_BEEP
setopt INC_APPEND_HISTORY
export KEYTIMEOUT=1
setopt AUTOPUSHD
setopt NO_BEEP
# tons of history
HISTSIZE=1000000 
SAVEHIST=1000000


# Making ctrl-h work in neovim
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/$TERM.ti
tic ~/$TERM.ti

# Setting up vim mode for zsh
bindkey -v

# Prompt related stuff
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

# Search up and down in history with arrow keys
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# PATHS
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/Library/Haskell/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH

# Functions
function z () {
  cd $(ds | fzf)
}

function runrust () {
  name=$(basename $1 .rs)
  rustc $@ && ./$name && command rm $name
}

function dkme () {
  eval $(docker-machine env $1)
}

function dkrm () {
  docker rm -f $(docker ps -aq)
}

function faid () {
  open "https://itunes.apple.com/app/id$1"
}

function ua () {
  alias $1 | awk -F "'" '$0=$2'
}

function ggrep () {
  if test $(git grep -c $1 | wc -l) -gt 10;
  then
    echo "Too many matches!"
  else
    nvim $(git grep --name-only $1)
  fi
}

function ghc-pkg-reset() {
  read 'ans?Erasing all your user ghc and cabal packages - are you sure (y/N)? '

  [[ x$ans =~ "xy" ]] && ( \
    echo 'erasing directories under ~/.ghc'; command rm -rf `find ~/.ghc/* -maxdepth 1 -type d`; \
    echo 'erasing ~/.cabal/lib'; command rm -rf ~/.cabal/lib; \
  )
}

function mcd () {
    mkdir "$@" && cd "$@"
}

function cs () {
    cd "$@" && ls
}

# Aliases hook
_aliases="$(alias -Lr 2>/dev/null || alias)"
alias_for() {
  [[ $1 =~ '[[:punct:]]' ]] && return
  local found="$( echo "$_aliases" | sed -nE "/^alias ${1}='?(.+)/s//\\1/p" )"
  [[ -n $found ]] && echo "${found%\'}"
}
force_alias_hook() {
  [[ $# -eq 0 ]] && return         # If there's no input, return. Else... 
  echo $1
}
autoload -U add-zsh-hook
add-zsh-hook preexec force_alias_hook

# Various script evals
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(fasd --init auto)"
# Don't want this alias from fasd
unalias z
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

expand-aliases() {
  unset 'functions[_expand-aliases]'
  functions[_expand-aliases]=$BUFFER
  (($+functions[_expand-aliases])) &&
    BUFFER=${functions[_expand-aliases]#$'\t'} &&
    CURSOR=$#BUFFER
}

zle -N expand-aliases
bindkey '^E' expand-aliases
