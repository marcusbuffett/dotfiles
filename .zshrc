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
export PATH="$PATH:$HOME/.cargo/bin"
export GOPATH="$HOME/go"
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOPATH/bin"
export AWS_KEYPAIR_NAME=Marcus
export NVM_DIR="/Users/marcusbuffett/.nvm"
export RUST_SRC_PATH="$HOME/Documents/etc/rust/src"
# export RUBYOPT=-rbumbler/go

# Aliases
alias v="nvim"
alias vi="nvim"
alias vvim="nvim ~/.vimrc"
alias vzshrc="nvim ~/.zshrc"
alias nvvim="nvim ~/.config/nvim/init.vim"
alias cabal-world="cabal --no-require-sandbox --ignore-sandbox"
alias grep='grep --color=auto'
alias tmux="tmux -2"
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
alias dk='docker'
alias dkm='docker-machine'
alias sp='spotify'
alias nxt='spotify next'
alias prv='spotify prev'
alias c='clear'

# Git aliases
alias fusro='git push origin head'
alias fusrodah='git push --force origin head'
alias glf='git ls-files'
alias gau='git add -u'
alias grbom='git rebase origin/master'
alias todo='nvim ~/.todo.md'
alias gsuno='git status -uno -s'
alias gfs='git ls-files -m $(git rev-parse --show-toplevel)'
alias gcmu='git ls-files --exclude-standard --others| fzf -m | xargs git add'
alias gcmum='gfs | fzf -m | xargs git add'
alias gbzf='git checkout $(git branch --list | cut -c 3- | fzf)'
alias grecb="git for-each-ref --sort=committerdate refs/heads/ --format='%(refname:short)'"
alias f_grecb="git for-each-ref --sort=committerdate refs/heads/ --format='%(refname:short)' | gtac | fzf --no-sort | xargs git checkout"
alias gsm='git ls-files -m | fzf -m | xargs'
alias gwe='git commit -a --fixup'

alias exf="exercism fetch"
alias exs="exercism submit"
alias lf='vim _lf'
alias ds="fasd -d | tr -s ' ' | cut -d ' ' -f 2"
alias fs="fasd -f | tr -s ' ' | cut -d ' ' -f 2"
alias dt='dasht'
alias pe='path-extractor'
alias rld='source ~/.zshrc'
alias ghmine='ghi list --mine'
alias ghmine_w='ghi list --mine --web'

alias -g F='| fzf -m'
alias -g E='| pe'
alias -g X='| xargs'
alias -g EFX='| pe | fzf -m | xargs'
alias -g P='| pbcopy'
alias gglr='googler -n5'

# Options
setopt AUTO_CD
setopt AUTO_LIST
setopt MENU_COMPLETE
unsetopt LIST_BEEP
setopt INC_APPEND_HISTORY
export KEYTIMEOUT=1
setopt AUTOPUSHD
setopt NO_BEEP
setopt HISTIGNORESPACE
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
bindkey '^p' up-line-or-search
bindkey '^n' down-line-or-search
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

function f () {
  v $(fs | fzf)
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

function gpr () {
 git fetch origin pull/$1/head:pr-$1
 git checkout pr-$1
}

function ghc-pkg-reset() {
  read 'ans?Erasing all your user ghc and cabal packages - are you sure (y/N)? '

  [[ x$ans =~ "xy" ]] && ( \
    echo 'erasing directories under ~/.ghc'; command rm -rf `find ~/.ghc/* -maxdepth 1 -type d`; \
    echo 'erasing ~/.cabal/lib'; command rm -rf ~/.cabal/lib; \
  )
}

function exsg() {
  file=$1
  exercism submit $file
  gtmp $file
}

function gtmp() {
  file=$1
  git add $file && git commit -m "Finish iteration of $(basename $(pwd))"
}

function mcd () {
    mkdir "$@" && cd "$@"
}

function cs () {
    cd "$@" && ls
}

# Various script evals
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(fasd --init posix-alias zsh-hook)"
# Don't want these aliases from fasd
unalias z
unalias f
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--bind ctrl-a:select-all"

expand-aliases() {
  unset 'functions[_expand-aliases]'
  functions[_expand-aliases]=$BUFFER
  (($+functions[_expand-aliases])) &&
    BUFFER=${functions[_expand-aliases]#$'\t'} &&
    CURSOR=$#BUFFER
}

#####################
## ZSH force alias ##
zle -N expand-aliases; bindkey '^E' expand-aliases
(force-alias-server > /dev/null &) > /dev/null 2>&1
if [[ -z "$NO_CHECK" ]]; then force-alias-client --init --pid $$; fi
function force_alias_hook() {
  if [[ -n "$NO_CHECK" ]]; then zle accept-line; return; fi
  force-alias-client --pid $$ -- $BUFFER
  if [[ $? -eq 1 ]]; then BUFFER=""; fi
  zle accept-line
}
autoload -U add-zsh-hook; zle -N force_alias_hook;
bindkey '^J' force_alias_hook; bindkey '^M' force_alias_hook;
## End ZSH force alias ##
#########################

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

source $HOME/.zshinit.private

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/Applications/MATLAB_R2016b.app/bin"
