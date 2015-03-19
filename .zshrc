source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle common-aliases
antigen bundle wd
antigen bundle fasd

## Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
## Load the theme.
antigen theme skaro
# Tell antigen that you're done.
antigen apply

export EDITOR="vim"
alias t="trash"
alias v="vim"
alias vvim="vim ~/.vimrc"
alias grep='grep --color=auto'
alias tmux="tmux -2"

setopt AUTO_CD
setopt AUTO_LIST
setopt MENU_COMPLETE
unsetopt LIST_BEEP
setopt INC_APPEND_HISTORY
export KEYTIMEOUT=1
setopt AUTOPUSHD
setopt NO_BEEP

bindkey -v

if [[ "$OSTYPE" == *"darwin"* ]]
then
    alias ls="ls -G"
elif [[ "$OSTYPE" == *"linux"* ]]
then
    alias ls="ls --color=AUTO"
    alias trash=gvfs-trash
fi

function mcd () {
    mkdir "$@" && cd "$@"
}
function cs () {
    cd "$@" && ls
}

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/Library/Haskell/bin:$PATH
export ZDOTDIR=$HOME
export NODE_ENV=development

PS1="%{$fg[cyan]%}%2~ %{$reset_color%}"
alias compile++="~/.compile.py"
alias compileRun++="~/.compileRun.py"

export NVM_DIR="/Users/marcusbuffett/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

function tr {
    tree -L 2;
}

