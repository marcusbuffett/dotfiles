# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zmodload zsh/zprof

KEYTIMEOUT=1

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

autoload -Uz compinit
compinit


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
  export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# zi is from zoxide, but I'm used to zd
alias zd=zi


alias v="nvim"
alias tmux="tmux -2"

# Git aliases
alias fusro='git push origin HEAD'
alias fusrodah='git push --force origin HEAD'
alias fuck_it_lets_do_it_live='git add -u && git commit --amend --no-edit && git push --force origin HEAD'
alias g='git'
alias k='kubectl'
alias lk='kubectl -n local-dev'
alias gm='git merge'
alias gcl='git clone'
alias gc!="git commit --amend"
alias glg='git log'
alias glf='git ls-files'
alias gau='git add -u'
alias grbom='git rebase origin/master'
alias gcd='git checkout develop'
alias gl='git pull'
alias gcb="git checkout -B" 
alias grb="git rebase"
alias grbi="git rebase -i"
alias grba="git rebase --abort"
alias grbs="git rebase --skip"
alias grbc="git rebase --continue"
alias gd="git diff"
alias gdca="git diff --cached"
alias gstl="git stash list"
alias ga="git add"
alias gc="git commit"
alias gcp="git cherry-pick"
alias gf="git fetch"
alias gco='git checkout'
alias gss='git status --short'
alias gs='git status'
alias gcm='git checkout main'
alias gsta="git stash"
alias gstaa="git stash apply"
alias f_grecb="git for-each-ref --sort=committerdate refs/heads/ --format='%(refname:short)' | tac | fzf --no-sort | xargs git checkout"
alias prsb='gh pr list --author "@me" -w --repo "https://github.com/ProjectOpenSea/opensea-api"'
alias prsf='gh pr list --author "@me" -w --repo "https://github.com/ProjectOpenSea/opensea-next"'

# source "/opt/homebrew/opt/spaceship/spaceship.zsh"

# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.local/bin:$PATH"

source ~/.secrets.zsh

export ADOBE_CONTENT_AUTHENTICITY_CLAIM_TOOL_PATH="packages/adobe-cai-cli/macos"
export RSVG_CONVERT_PATH=/usr/local/bin

# pyenv activate opensea
eval "$(zoxide init zsh)"

export PATH="$PATH:/Users/marcusbuffett/.foundry/bin"
source <(kubectl completion zsh)
export PATH="./node_modules/.bin/:$PATH"


# pnpm
export PNPM_HOME="/Users/marcusbuffett/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export ZK_NOTEBOOK_DIR="$HOME/zk-notebook"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH=$HOME/projects
export PATH=$PATH:$GOPATH/bin


# pnpm
export PNPM_HOME="/Users/marcusbuffett/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# spaceship add --before char vi_mode

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd)"


# bun completions
[ -s "/Users/marcusbuffett/.bun/_bun" ] && source "/Users/marcusbuffett/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zprof

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
