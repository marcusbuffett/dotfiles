# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zmodload zsh/zprof

KEYTIMEOUT=1
export VI_MODE_SET_CURSOR=true


# Check if antidote is installed
if [[ -f ${ZDOTDIR:-~}/.antidote/antidote.zsh ]]; then
  source ${ZDOTDIR:-~}/.antidote/antidote.zsh
  antidote load
fi

autoload -Uz compinit
compinit

setopt -o sharehistory

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
# setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
# setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
# setopt HIST_BEEP                 # Beep when accessing nonexistent history.



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

# zi is from zoxide, but z is difficult to type
alias de=zi


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
alias l="exa"
alias ls="exa"
alias ll="exa -lah"

# source "/opt/homebrew/opt/spaceship/spaceship.zsh"

export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
export PATH="$HOME/.local/bin:$PATH"

source ~/.secrets.zsh

export ADOBE_CONTENT_AUTHENTICITY_CLAIM_TOOL_PATH="packages/adobe-cai-cli/macos"
export RSVG_CONVERT_PATH=/usr/local/bin

if command -v zoxide 1>/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

export PATH="$PATH:/Users/marcusbuffett/.foundry/bin"
# Check if kubectl is installed
if command -v kubectl 1>/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi
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

export GOPATH="/usr/local/go"
export PATH="$PATH:$GOPATH/bin"


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
export PATH="$PATH:$BUN_INSTALL/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zprof

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

# eval "$(direnv hook zsh)"


# gitui in nvim thing
# https://github.com/extrawurst/gitui/issues/495
# not using because https://github.com/extrawurst/gitui/issues/1933
# ssh-add -q ~/.ssh/id_rsa

export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marcusbuffett/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/marcusbuffett/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/marcusbuffett/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/marcusbuffett/google-cloud-sdk/completion.zsh.inc'; fi

export CLOUDSDK_PYTHON_SITEPACKAGES=1


function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


export PATH="$PATH:/opt/nvim-linux64/bin"
