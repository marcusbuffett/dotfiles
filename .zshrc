source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle common-aliases
antigen bundle wd

## Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
## Load the theme.
antigen theme skaro
# Tell antigen that you're done.
antigen apply

export EDITOR="vim"
alias t="trash"
alias ls="ls -G"
alias v="vim"
alias vvim="vim ~/.vimrc"
alias grep='grep --color=auto'

setopt AUTO_CD
setopt AUTO_LIST
setopt MENU_COMPLETE
unsetopt LIST_BEEP
setopt INC_APPEND_HISTORY
setopt AUTOPUSHD

bindkey -v

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/Library/Haskell/bin:$PATH

# unregister broken GHC packages. Run this a few times to resolve dependency rot in installed packages.
# ghc-pkg-clean -f cabal/dev/packages*.conf also works.
function ghc-pkg-clean() {
  for p in `ghc-pkg check $* 2>&1  | grep problems | awk '{print $6}' | sed -e 's/:$//'`
  do
    echo unregistering $p; ghc-pkg $* unregister $p
  done
}

function gpprun () {
    g++ $1 && ./a.out && t a.out
}
 
# remove all installed GHC/cabal packages, leaving ~/.cabal binaries and docs in place.
# When all else fails, use this to get out of dependency hell and start over.
function ghc-pkg-reset() {
  if [[ $(readlink -f /proc/$$/exe) =~ zsh ]]; then
    read 'ans?Erasing all your user ghc and cabal packages - are you sure (y/N)? '
  else # assume bash/bash compatible otherwise
    read -p 'Erasing all your user ghc and cabal packages - are you sure (y/N)? ' ans
  fi
 
  [[ x$ans =~ "xy" ]] && ( \
    echo 'erasing directories under ~/.ghc'; command rm -rf `find ~/.ghc/* -maxdepth 1 -type d`; \
    echo 'erasing ~/.cabal/lib'; command rm -rf ~/.cabal/lib; \
  )
}
 
alias cabalupgrades="cabal list --installed  | egrep -iv '(synopsis|homepage|license)'"
function compile() 
{
    clang++ -Wall -Wvla -Wshadow -Wunreachable-code -Wconversion -Wno-write-strings -Wno-sign-compare -Wno-sign-conversion -Wno-shorten-64-to-32 -g $1 -o 
}
PS1="%{$fg[green]%}%h %{$fg[cyan]%}%2~ %{$reset_color%}»"

