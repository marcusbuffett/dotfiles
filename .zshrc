source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle common-aliases
antigen bundle wd

## Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle ehamberg/zsh-cabal-completion
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

export EDITOR="vim"

export GOPATH="$HOME/go"
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOPATH/bin"
alias v="vim"
alias vvim="v ~/.vimrc"
alias cabal-world="cabal --no-require-sandbox --ignore-sandbox"
alias grep='grep --color=auto'
alias tmux="tmux -2"
# alias http-server="http-server -p 9000 -a 127.0.0.1"
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
alias dk='docker'
alias dkm='docker-machine'
alias gph='git push origin head'
function dkme () {
  eval $(docker-machine env $1)
}
function dkrm () {
  docker rm -f $(docker ps -aq)
}
function faid () {
  open "https://itunes.apple.com/app/id$1"
}

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
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/Library/Haskell/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export ZDOTDIR=$HOME
export NODE_ENV=development

export NVM_DIR="/Users/marcusbuffett/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

function tr {
    tree -L 2;
}
function ggrep () {
  if test $(git grep -c $1 | wc -l) -gt 10;
  then
    echo "Too many matches!"
  else
    vim $(git grep --name-only $1)
  fi
}

# Really weird fix for Control-H not working in neovim, black magic below
# infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
# tic $TERM.ti

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

eval "$(fasd --init auto)"

# ghc-pkg-clean -f cabal/dev/packages*.conf also works.
function ghc-pkg-clean() {
  for p in `ghc-pkg check $* 2>&1  | grep problems | awk '{print $6}' | sed -e 's/:$//'`
  do
    echo unregistering $p; ghc-pkg $* unregister $p
  done
}

# remove all installed GHC/cabal packages, leaving ~/.cabal binaries and docs in place.
# When all else fails, use this to get out of dependency hell and start over.
function ghc-pkg-reset() {
  read 'ans?Erasing all your user ghc and cabal packages - are you sure (y/N)? '

  [[ x$ans =~ "xy" ]] && ( \
    echo 'erasing directories under ~/.ghc'; command rm -rf `find ~/.ghc/* -maxdepth 1 -type d`; \
    echo 'erasing ~/.cabal/lib'; command rm -rf ~/.cabal/lib; \
  )
}

# source aws_keys.sh

alias cabalupgrades="cabal list --installed  | egrep -iv '(synopsis|homepage|license)'"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

preexec() {
  date=`date +%s`
  cmd=$1
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    branch=$(git branch | grep "* " | awk '{print $2}')
    repo=$(basename `git rev-parse --show-toplevel`)
  else
    branch="N/A"
    repo="N/A"
  fi
  echo "$date, `pwd`, $repo, $branch, $1" >> ~/.zsh_history_long
}
